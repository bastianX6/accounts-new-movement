//
//  NewMovementSavingState.swift
//
//
//  Created by Bastián Véliz Vega on 01-10-20.
//

import Combine
import Foundation

class NewMovementSavingState: NewMovementViewState {
    private weak var viewModel: NewMovementViewModel?

    var cancellables: [Cancellable] = []

    init(viewModel: NewMovementViewModel?) {
        self.viewModel = viewModel
    }

    var isIncome: Bool = false
    let showLoading: Bool = true
    var isEdition: Bool = false

    var navigationBarTitle: String {
        if self.isEdition {
            return self.isIncome ? L10n.editIncome : L10n.editExpenditure
        } else {
            return self.isIncome ? L10n.newIncome : L10n.newExpenditure
        }
    }

    var movementDetailTitle: String {
        return self.isIncome ? L10n.incomeDetails : L10n.expenditureDetails
    }

    func saveAction() {
        self.cancellables.removeAll()
        guard let viewModel = self.viewModel else { return }
        let cancellable = viewModel.saveMovement()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let strongSelf = self else { return }
                switch completion {
                case .finished:
                    strongSelf.viewModel?.setState(.end)
                case let .failure(error):
                    print("Save movement error: \(String(describing: error))")
                    strongSelf.viewModel?.setState(.error)
                }
            }, receiveValue: {})

        self.cancellables.append(cancellable)
    }

    func cancelAction() {}

    func endAction() {}
}

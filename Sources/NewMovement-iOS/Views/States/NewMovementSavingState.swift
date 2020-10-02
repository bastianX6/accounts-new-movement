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
    var showSheet: Bool = true
    let showLoading: Bool = true
    var navigationBarTitle: String {
        return self.isIncome ? L10n.newIncome : L10n.newExpediture
    }

    var movementDetailTitle: String {
        return self.isIncome ? L10n.incomeDetails : L10n.expeditureDetails
    }

    func saveAction() {
        self.cancellables.removeAll()
        guard let viewModel = self.viewModel else { return }
        let cancellable = viewModel.saveMovement().sink(receiveCompletion: { [weak self] completion in
            guard let strongSelf = self else { return }
            switch completion {
            case .finished:
                strongSelf.viewModel?.setState(.initial)
            case let .failure(error):
                print("Save movement error: \(String(describing: error))")
                strongSelf.viewModel?.setState(.error)
            }
        }, receiveValue: {})

        self.cancellables.append(cancellable)
    }

    func cancelAction() {}
}

//
//  NewMovementDeletingState.swift
//
//
//  Created by Bastián Véliz Vega on 18-10-20.
//

import Combine
import Foundation

public class NewMovementDeletingState: NewMovementViewBaseState {
    private weak var viewModel: NewMovementViewModel?

    var cancellables: [Cancellable] = []

    public init(viewModel: NewMovementViewModel?) {
        super.init()
        self.viewModel = viewModel
        self.showLoading = true
    }

    override public func deleteAction() {
        self.cancellables.removeAll()
        guard let viewModel = self.viewModel else { return }
        let cancellable = viewModel.deleteMovement()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let strongSelf = self else { return }
                switch completion {
                case .finished:
                    strongSelf.viewModel?.setState(.end)
                case let .failure(error):
                    print("Save movement error: \(String(describing: error))")
                    strongSelf.viewModel?.setState(.error(error: error))
                }
            }, receiveValue: {})

        self.cancellables.append(cancellable)
    }
}

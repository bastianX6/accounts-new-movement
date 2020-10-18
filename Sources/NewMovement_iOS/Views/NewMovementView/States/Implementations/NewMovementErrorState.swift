//
//  NewMovementErrorState.swift
//
//
//  Created by Bastián Véliz Vega on 01-10-20.
//

import Foundation

class NewMovementErrorState: NewMovementViewBaseState {
    private weak var viewModel: NewMovementViewModel?

    init(viewModel: NewMovementViewModel?) {
        self.viewModel = viewModel
    }

    override func cancelAction() {
        self.viewModel?.setState(.end)
    }
}

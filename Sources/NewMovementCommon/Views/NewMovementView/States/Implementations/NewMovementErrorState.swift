//
//  NewMovementErrorState.swift
//
//
//  Created by Bastián Véliz Vega on 01-10-20.
//

import Foundation

public class NewMovementErrorState: NewMovementViewBaseState {
    private weak var viewModel: NewMovementViewModel?

    public init(viewModel: NewMovementViewModel?) {
        self.viewModel = viewModel
    }

    override public func cancelAction() {
        self.viewModel?.setState(.end)
    }
}

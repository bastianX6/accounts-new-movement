//
//  NewMovementErrorState.swift
//
//
//  Created by Bastián Véliz Vega on 01-10-20.
//

import Foundation

class NewMovementErrorState: NewMovementViewState {
    private weak var viewModel: NewMovementViewModel?

    init(viewModel: NewMovementViewModel?) {
        self.viewModel = viewModel
    }

    var isIncome: Bool = false
    var showSheet: Bool = true
    let showLoading: Bool = false
    var navigationBarTitle: String {
        return self.isIncome ? L10n.newIncome : L10n.newExpediture
    }

    var movementDetailTitle: String {
        return self.isIncome ? L10n.incomeDetails : L10n.expeditureDetails
    }

    func saveAction() {}

    func cancelAction() {
        self.viewModel?.setState(.initial)
    }
}

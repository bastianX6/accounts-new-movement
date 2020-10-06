//
//  NewMovementShowSheetState.swift
//
//
//  Created by Bastián Véliz Vega on 01-10-20.
//

import Foundation

class NewMovementShowSheetState: NewMovementViewState {
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

    func saveAction() {
        self.viewModel?.setState(.saving)
        // TODO: Save action
        /*
         - Check data
           - If data is correct -> transition to saving state
           - Else -> Transition to error state
         */
    }

    func cancelAction() {
        self.viewModel?.setState(.initial)
    }
}

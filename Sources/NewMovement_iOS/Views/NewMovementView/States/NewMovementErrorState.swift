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
    let showLoading: Bool = false
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

    func saveAction() {}

    func cancelAction() {
        self.viewModel?.setState(.end)
    }
    
    func endAction() {}
}

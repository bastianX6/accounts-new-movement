//
//  NewMovementViewBaseState.swift
//
//
//  Created by Bastián Véliz Vega on 18-10-20.
//

import Foundation

class NewMovementViewBaseState: NewMovementViewState {
    var isIncome: Bool = false
    var showLoading: Bool = false
    var isEdition: Bool = false
    var showDeleteAlert: Bool = false
    var error: Error?
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

    func cancelAction() {}

    func deleteAction() {}

    func endAction() {}
}

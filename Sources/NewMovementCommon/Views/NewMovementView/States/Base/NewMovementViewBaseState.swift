//
//  NewMovementViewBaseState.swift
//
//
//  Created by Bastián Véliz Vega on 18-10-20.
//

import Foundation

public class NewMovementViewBaseState: NewMovementViewState {

    public var isIncome: Bool = false
    public var showLoading: Bool = false
    public var isEdition: Bool = false
    public var showDeleteAlert: Bool = false
    public var error: Error?
    public var navigationBarTitle: String {
        if self.isEdition {
            return self.isIncome ? L10n.editIncome : L10n.editExpenditure
        } else {
            return self.isIncome ? L10n.newIncome : L10n.newExpenditure
        }
    }

    public var movementDetailTitle: String {
        return self.isIncome ? L10n.incomeDetails : L10n.expenditureDetails
    }

    public func saveAction() {}

    public func cancelAction() {}

    public func deleteAction() {}

    public func endAction() {}
}

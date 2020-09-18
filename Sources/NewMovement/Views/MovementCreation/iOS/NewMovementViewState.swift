//
//  NewMovementViewState.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import Foundation

enum NewMovementViewStateEnum {
    case initial
    case showSheet(isIncome: Bool)
    case saving
    case error
}

protocol NewMovementViewState: AnyObject {
    var isIncome: Bool { get set }
    var showSheet: Bool { get set }
    var showLoading: Bool { get }
    var navigationBarTitle: String { get }

    func saveAction()
    func cancelAction()
}

class NewMovementInitialState: NewMovementViewState {
    var isIncome: Bool = false
    var showSheet: Bool = false
    let showLoading: Bool = false
    let navigationBarTitle: String = ""
    func saveAction() {}
    func cancelAction() {}
}

class NewMovementShowSheetState: NewMovementViewState {
    private weak var manager: NewMovementViewModel?

    init(manager: NewMovementViewModel?) {
        self.manager = manager
    }

    var isIncome: Bool = false
    var showSheet: Bool = true
    let showLoading: Bool = false
    var navigationBarTitle: String {
        return self.isIncome ? L10n.newIncome : L10n.newExpediture
    }

    func saveAction() {
        // TODO: Save action
        /*
         - Check data
           - If data is correct -> transition to saving state
           - Else -> Transition to error state
         */
    }

    func cancelAction() {
        self.manager?.setState(.initial)
    }
}

class NewMovementSavingState: NewMovementViewState {
    private weak var manager: NewMovementViewModel?

    init(manager: NewMovementViewModel?) {
        self.manager = manager
    }

    var isIncome: Bool = false
    var showSheet: Bool = true
    let showLoading: Bool = true
    var navigationBarTitle: String {
        return self.isIncome ? L10n.newIncome : L10n.newExpediture
    }

    func saveAction() {
        // TODO: Saving action
        /*
         - Wait for save result
           - If save is correct -> transition to initial state
           - Else -> Transition to error state
         */
    }

    func cancelAction() {}
}

class NewMovementErrorState: NewMovementViewState {
    private weak var manager: NewMovementViewModel?

    init(manager: NewMovementViewModel?) {
        self.manager = manager
    }

    var isIncome: Bool = false
    var showSheet: Bool = true
    let showLoading: Bool = false
    var navigationBarTitle: String {
        return self.isIncome ? L10n.newIncome : L10n.newExpediture
    }

    func saveAction() {}

    func cancelAction() {
        self.manager?.setState(.initial)
    }
}

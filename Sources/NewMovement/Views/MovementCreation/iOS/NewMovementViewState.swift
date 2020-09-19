//
//  NewMovementViewState.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import Combine
import Foundation

// MARK: - State definition

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
    var movementDetailTitle: String { get }

    func saveAction()
    func cancelAction()
}

// MARK: - States implementation

class NewMovementInitialState: NewMovementViewState {
    var isIncome: Bool = false
    var showSheet: Bool = false
    let showLoading: Bool = false
    let navigationBarTitle: String = ""
    let movementDetailTitle: String = ""
    func saveAction() {}
    func cancelAction() {}
}

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

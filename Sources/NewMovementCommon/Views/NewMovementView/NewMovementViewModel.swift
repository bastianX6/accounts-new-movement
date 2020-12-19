//
//  NewMovementBaseManager.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import AccountsUI
import Combine
import DataManagement
import Foundation

public class NewMovementViewModel: ObservableObject {
    // MARK: - UI management

    @Published public var model: NewMovementViewInternalDataModel
    @Published public var state: NewMovementViewState = NewMovementViewBaseState()

    private lazy var savingState: NewMovementViewState = NewMovementSavingState(viewModel: self)
    private lazy var errorState: NewMovementViewState = NewMovementErrorState(viewModel: self)
    private lazy var deletingState: NewMovementViewState = NewMovementDeletingState(viewModel: self)
    private var askForDeletingState: NewMovementViewState = NewMovementAskingForDeleteState()
    public private(set) lazy var endState = NewMovementEndState()

    private var dataSource: DataSourceModify
    public var isIncome: Bool = false {
        didSet {
            self.updateIsIncome()
        }
    }

    public var isEdition: Bool = false {
        didSet {
            self.updateIsEdition()
        }
    }

    private let incomeData: MovementResources
    private let expenditureData: MovementResources

    public var stores: [CategoryStoreModel] {
        return self.isIncome ? self.incomeData.stores : self.expenditureData.stores
    }

    public var categories: [CategoryStoreModel] {
        return self.isIncome ? self.incomeData.categories : self.expenditureData.categories
    }

    public init(model: NewMovementViewInternalDataModel,
                dataSource: DataSourceModify,
                incomeData: MovementResources,
                expenditureData: MovementResources,
                onEnd: @escaping () -> Void)
    {
        self.model = model
        self.dataSource = dataSource
        self.incomeData = incomeData
        self.expenditureData = expenditureData
        self.endState.onEnd = onEnd
    }

    public convenience init(dataSource: DataSourceModify,
                            incomeData: MovementResources,
                            expenditureData: MovementResources,
                            onEnd: @escaping () -> Void)
    {
        let model = NewMovementViewInternalDataModel(currentStore: UUID(),
                                                     currentCategory: UUID())
        self.init(model: model,
                  dataSource: dataSource,
                  incomeData: incomeData,
                  expenditureData: expenditureData,
                  onEnd: onEnd)
    }

    public func setState(_ state: NewMovementViewStateEnum) {
        switch state {
        case .saving:
            self.state = self.savingState
            self.state.saveAction()
        case .error:
            self.state = self.errorState
        case .end:
            self.state = self.endState
            self.state.endAction()
        case .askingForDelete:
            self.askForDeletingState.showDeleteAlert = true
            self.state = self.askForDeletingState
        case .deleting:
            self.state = self.deletingState
            self.state.deleteAction()
        }
    }

    func saveMovement() -> AnyPublisher<Void, Error> {
        let movement = NewMovementAdapter(model: self.model)
        if self.model.isNew {
            return self.dataSource.save(movement: movement)
        } else {
            return self.dataSource.update(movement: movement)
        }
    }

    func deleteMovement() -> AnyPublisher<Void, Error> {
        let movement = NewMovementAdapter(model: self.model)
        return self.dataSource.delete(movement: movement)
    }

    private func updateIsIncome() {
        self.savingState.isIncome = self.isIncome
        self.errorState.isIncome = self.isIncome
        self.endState.isIncome = self.isIncome
        self.askForDeletingState.isIncome = self.isIncome
        self.deletingState.isIncome = self.isIncome
        self.state.isIncome = self.isIncome

        guard self.model.isNew else { return }

        if let currentStore = self.stores.first?.id,
           let currentCategory = self.categories.first?.id
        {
            self.model = NewMovementViewInternalDataModel(currentStore: currentStore,
                                                          currentCategory: currentCategory)
        } else {
            fatalError("Can't init NewMovementViewModel with empty store and category arrays")
        }
    }

    private func updateIsEdition() {
        self.savingState.isEdition = self.isEdition
        self.errorState.isEdition = self.isEdition
        self.endState.isEdition = self.isEdition
        self.askForDeletingState.isEdition = self.isEdition
        self.deletingState.isEdition = self.isEdition
        self.state.isEdition = self.isEdition
    }
}

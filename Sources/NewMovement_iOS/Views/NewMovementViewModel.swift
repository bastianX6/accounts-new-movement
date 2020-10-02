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

class NewMovementViewModel: ObservableObject {
    // MARK: - UI management

    @Published var model: NewMovementView.DataModel
    @Published var state: NewMovementViewState = NewMovementInitialState()

    private lazy var initialState: NewMovementViewState = NewMovementInitialState()
    private lazy var showSheetState: NewMovementViewState = NewMovementShowSheetState(viewModel: self)
    private lazy var savingState: NewMovementViewState = NewMovementSavingState(viewModel: self)
    private lazy var errorState: NewMovementViewState = NewMovementErrorState(viewModel: self)

    private var dataSource: DataSourceModify
    private var isIncome: Bool = false

    private let incomeData: MovementResources
    private let expeditureData: MovementResources

    var stores: [CategoryStoreModel] {
        return self.isIncome ? self.incomeData.stores : self.expeditureData.stores
    }

    var categories: [CategoryStoreModel] {
        return self.isIncome ? self.incomeData.categories : self.expeditureData.categories
    }

    init(model: NewMovementView.DataModel,
         dataSource: DataSourceModify,
         incomeData: MovementResources,
         expeditureData: MovementResources) {
        self.model = model
        self.dataSource = dataSource
        self.incomeData = incomeData
        self.expeditureData = expeditureData
    }

    init(dataSource: DataSourceModify,
         incomeData: MovementResources,
         expeditureData: MovementResources) {
        self.dataSource = dataSource
        self.incomeData = incomeData
        self.expeditureData = expeditureData
        self.model = NewMovementView.DataModel(currentStore: UUID(),
                                          currentCategory: UUID())
    }

    func setState(_ state: NewMovementViewStateEnum) {
        switch state {
        case .initial:
            self.state = self.initialState
        case let .showSheet(isIncome):
            self.isIncome = isIncome
            if let currentStore = self.stores.first?.id,
                let currentCategory = self.categories.first?.id {
                self.model = NewMovementView.DataModel(currentStore: currentStore,
                                                  currentCategory: currentCategory)
            } else {
                fatalError("Can't init NewMovementViewModel with empty store and category arrays")
            }
            self.showSheetState.showSheet = true
            self.showSheetState.isIncome = isIncome
            self.state = self.showSheetState
        case .saving:
            self.state = self.savingState
        case .error:
            self.state = self.showSheetState
        }
    }

    func saveMovement() -> AnyPublisher<Void, Error> {
        let movement = NewMovementAdapter(model: self.model)
        return self.dataSource.save(movement: movement)
    }
}

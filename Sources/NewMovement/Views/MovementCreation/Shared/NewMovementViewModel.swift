//
//  NewMovementBaseManager.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import Combine
import DataManagement

class NewMovementViewModel: ObservableObject {
    // MARK: - UI management

    @Published var model: NewMovementBaseModel
    @Published var state: NewMovementViewState = NewMovementInitialState()

    private lazy var initialState: NewMovementViewState = NewMovementInitialState()
    private lazy var showSheetState: NewMovementViewState = NewMovementShowSheetState(viewModel: self)
    private lazy var savingState: NewMovementViewState = NewMovementSavingState(viewModel: self)
    private lazy var errorState: NewMovementViewState = NewMovementErrorState(viewModel: self)

    private var dataSource: DataSourceModify

    let stores: [CategoryStoreModel]
    let categories: [CategoryStoreModel]

    init(model: NewMovementBaseModel,
         dataSource: DataSourceModify,
         stores: [CategoryStoreModel],
         categories: [CategoryStoreModel]) {
        self.model = model
        self.dataSource = dataSource
        self.stores = stores
        self.categories = categories
    }

    init(dataSource: DataSourceModify,
         stores: [CategoryStoreModel],
         categories: [CategoryStoreModel]) {
        self.dataSource = dataSource
        self.stores = stores
        self.categories = categories

        if let currentStore = stores.first?.id,
            let currentCategory = categories.first?.id {
            self.model = NewMovementBaseModel(currentStore: currentStore,
                                              currentCategory: currentCategory)
        } else {
            fatalError("Can't init NewMovementViewModel with empty store and category arrays")
        }
    }

    func setState(_ state: NewMovementViewStateEnum) {
        switch state {
        case .initial:
            self.state = self.initialState
        case let .showSheet(isIncome):
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

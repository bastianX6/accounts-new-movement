//
//  NewMovementBaseManager.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import Combine

class NewMovementViewModel: ObservableObject {
    // MARK: - UI management

    @Published var model: NewMovementBaseModel
    @Published var state: NewMovementViewState = NewMovementInitialState()

    private lazy var initialState: NewMovementViewState = NewMovementInitialState()
    private lazy var showSheetState: NewMovementViewState = NewMovementShowSheetState(manager: self)
    private lazy var savingState: NewMovementViewState = NewMovementSavingState(manager: self)
    private lazy var errorState: NewMovementViewState = NewMovementErrorState(manager: self)

    let stores: [CategoryStoreModel]
    let categories: [CategoryStoreModel]

    init(model: NewMovementBaseModel,
         stores: [CategoryStoreModel],
         categories: [CategoryStoreModel]) {
        self.model = model

        self.stores = stores
        self.categories = categories
    }

    init(stores: [CategoryStoreModel],
         categories: [CategoryStoreModel]) {
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
}

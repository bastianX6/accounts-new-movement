//
//  NewMovementBaseManager.swift
//  
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import Combine

class NewMovementBaseManager: ObservableObject {
    // MARK: - UI management

    @Published var model: NewMovementBaseModel

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
            fatalError("Can't init NewMovementBaseManager with empty store and category arrays")
        }
    }
}

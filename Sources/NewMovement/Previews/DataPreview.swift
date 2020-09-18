//
//  DataPreview.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import AccountsUI
import DataManagement
import Foundation

enum DataPreview {
    static let categoryId = UUID()
    static let storeId = UUID()

    static var categories: [CategoryStoreModel] {
        var array = [CategoryStoreModel]()
        array.append(CategoryStoreModel(name: "Category 1", id: self.categoryId))
        array.append(CategoryStoreModel(name: "Category 2", id: UUID()))
        array.append(CategoryStoreModel(name: "Category 3", id: UUID()))
        return array
    }

    static var stores: [CategoryStoreModel] {
        var array = [CategoryStoreModel]()
        array.append(CategoryStoreModel(name: "Store 1", id: self.storeId))
        array.append(CategoryStoreModel(name: "Store 2", id: UUID()))
        array.append(CategoryStoreModel(name: "Store 3", id: UUID()))
        return array
    }

    static var model: NewMovementBaseModel {
        return NewMovementBaseModel(currentStore: self.storeId,
                                    currentCategory: self.categoryId)
    }

    static var modelWithData: NewMovementBaseModel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let date = dateFormatter.date(from: "2018-02-02") ?? Date()

        let model = NewMovementBaseModel(title: "A title",
                                         date: date,
                                         amount: 150_000,
                                         comments: "Comments :)",
                                         currentStore: self.storeId,
                                         currentCategory: self.categoryId)
        return model
    }

    static var viewModel: NewMovementViewModel {
        return NewMovementViewModel(model: self.modelWithData,
                                    dataSource: self.dataSource,
                                    stores: self.stores,
                                    categories: self.categories)
    }

    static var dataSource: DataSourceModify {
        return MovementPreview()
    }

    static var dataModel: NewMovementViewDataModel {
        return NewMovementViewDataModel(dataSource: self.dataSource,
                                        stores: self.stores,
                                        categories: self.categories)
    }
}
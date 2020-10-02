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
        array.append(CategoryStoreModel(name: "Category 1", id: self.categoryId, color: .indigo, icon: "creditcard.fill"))
        array.append(CategoryStoreModel(name: "Category 2", id: UUID(), color: .indigo, icon: "creditcard.fill"))
        array.append(CategoryStoreModel(name: "Category 3", id: UUID(), color: .indigo, icon: "creditcard.fill"))
        return array
    }

    static var stores: [CategoryStoreModel] {
        var array = [CategoryStoreModel]()
        array.append(CategoryStoreModel(name: "Store 1", id: self.storeId, color: .indigo, icon: "creditcard.fill"))
        array.append(CategoryStoreModel(name: "Store 2", id: UUID(), color: .indigo, icon: "creditcard.fill"))
        array.append(CategoryStoreModel(name: "Store 3", id: UUID(), color: .indigo, icon: "creditcard.fill"))
        return array
    }

    static var model: NewMovementView.DataModel {
        return NewMovementView.DataModel(currentStore: self.storeId,
                                    currentCategory: self.categoryId)
    }

    static var modelWithData: NewMovementView.DataModel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let date = dateFormatter.date(from: "2018-02-02") ?? Date()

        let model = NewMovementView.DataModel(title: "A title",
                                         date: date,
                                         amount: 150_000,
                                         comments: "Comments :)",
                                         currentStore: self.storeId,
                                         currentCategory: self.categoryId)
        return model
    }

    static var incomeData: MovementResources {
        return MovementResources(categories: self.categories, stores: self.stores)
    }

    static var expeditureData: MovementResources {
        return MovementResources(categories: self.categories, stores: self.stores)
    }

    static var viewModel: NewMovementViewModel {
        return NewMovementViewModel(model: self.modelWithData,
                                    dataSource: self.dataSource,
                                    incomeData: self.incomeData,
                                    expeditureData: self.expeditureData)
    }

    static var dataSource: DataSourceModify {
        return MovementPreview()
    }

    static var dataModel: NewMovementViewDataModel {
        return NewMovementViewDataModel(dataSource: self.dataSource,
                                        incomeData: self.incomeData,
                                        expeditureData: self.expeditureData)
    }

    static func baseViewDataModel(isIncome: Bool) -> NewMovementView.DataResources {
        return NewMovementView.DataResources(categories: self.categories,
                                        stores: self.stores,
                                        customDataSectionTitle: "Custom data section title",
                                        isIncome: isIncome)
    }
}

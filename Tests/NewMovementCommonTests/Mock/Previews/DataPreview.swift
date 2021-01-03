//
//  DataPreview.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import AccountsUI
import DataManagement
import Foundation
import NewMovementCommon

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

    static var model: NewMovementViewInternalDataModel {
        return NewMovementViewInternalDataModel(currentStore: self.storeId,
                                                 currentCategory: self.categoryId)
    }

    static var modelWithData: NewMovementViewInternalDataModel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let date = dateFormatter.date(from: "2018-02-02") ?? Date()

        let model = NewMovementViewInternalDataModel(title: "A title",
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

    static var expenditureData: MovementResources {
        return MovementResources(categories: self.categories, stores: self.stores)
    }

    static var viewModel: NewMovementViewModel {
        return NewMovementViewModel(model: self.modelWithData,
                                    dataSource: self.dataSource,
                                    incomeData: self.incomeData,
                                    expenditureData: self.expenditureData,
                                    onEnd: {})
    }

    static var dataSource: DataSourceModify {
        return MovementPreview()
    }

    static func baseViewDataModel(isIncome: Bool) -> NewMovementViewInternalDataResources {
        return NewMovementViewInternalDataResources(categories: self.categories,
                                                     stores: self.stores,
                                                     customDataSectionTitle: "Custom data section title",
                                                     isIncome: isIncome)
    }

    private struct PreviewMovement: Movement {
        var id: UUID = UUID()
        var name: String = ""
        var description: String = ""
        var amount: Float = 0
        var date: Date = Date()
        var isPaid: Bool = false
        var isPermanent: Bool = false
        var storeId: UUID = UUID()
        var categoryId: UUID = UUID()
        var paymentId: UUID?
    }

    static var movement: Movement {
        return PreviewMovement(id: UUID(),
                               name: "movement 1",
                               description: "This is a movement",
                               amount: 100,
                               date: Date(),
                               isPermanent: true)
    }
}

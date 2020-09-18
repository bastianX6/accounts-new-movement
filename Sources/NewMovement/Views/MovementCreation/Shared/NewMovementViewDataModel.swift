//
//  NewMovementViewDataModel.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import AccountsUI
import DataManagement
import Foundation

/// Contains all the data required by NewMovementView
public struct NewMovementViewDataModel {
    let dataSource: DataSourceModify
    let stores: [CategoryStoreModel]
    let categories: [CategoryStoreModel]

    /// Default initializer
    /// - Parameters:
    ///   - dataSource: data source used to store data
    ///   - stores: store list
    ///   - categories: categories list
    public init(dataSource: DataSourceModify,
                stores: [CategoryStoreModel],
                categories: [CategoryStoreModel]) {
        self.dataSource = dataSource
        self.stores = stores
        self.categories = categories
    }
}

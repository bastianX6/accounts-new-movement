//
//  NewMovementViewDataModel.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import DataManagement
import Foundation

public struct NewMovementViewDataModel {
    let dataSource: DataSourceModify
    let stores: [CategoryStoreModel]
    let categories: [CategoryStoreModel]

    public init(dataSource: DataSourceModify,
                stores: [CategoryStoreModel],
                categories: [CategoryStoreModel]) {
        self.dataSource = dataSource
        self.stores = stores
        self.categories = categories
    }
}

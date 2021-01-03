//
//  NewMovementViewDataModel.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import DataManagement
import Foundation
import AccountsUI

/// Contains all the data required by NewMovementView
public struct NewMovementViewDataModel {
    public let dataSource: DataSourceModify
    public let incomeData: MovementResources
    public let expenditureData: MovementResources

    /// Default initializer
    /// - Parameters:
    ///   - dataSource: data source used to store data
    ///   - incomeData: income data with category and stores
    ///   - expenditureData: expenditure data with category and stores
    public init(dataSource: DataSourceModify,
                incomeData: MovementResources,
                expenditureData: MovementResources) {
        self.dataSource = dataSource
        self.incomeData = incomeData
        self.expenditureData = expenditureData
    }
}

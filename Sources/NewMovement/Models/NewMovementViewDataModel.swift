//
//  NewMovementViewDataModel.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import DataManagement
import Foundation

/// Contains all the data required by NewMovementView
public struct NewMovementViewDataModel {
    let dataSource: DataSourceModify
    let incomeData: NewMovementResources
    let expeditureData: NewMovementResources

    /// Default initializer
    /// - Parameters:
    ///   - dataSource: data source used to store data
    ///   - incomeData: income data with category and stores
    ///   - expeditureData: expediture data with category and stores
    public init(dataSource: DataSourceModify,
                incomeData: NewMovementResources,
                expeditureData: NewMovementResources) {
        self.dataSource = dataSource
        self.incomeData = incomeData
        self.expeditureData = expeditureData
    }
}

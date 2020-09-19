//
//  NewMovementResources.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import Foundation

/// Stores category and stores
public struct NewMovementResources: Codable {
    /// Categories array
    public let categories: [CategoryStoreModel]

    /// Stores array
    public let stores: [CategoryStoreModel]

    /// Default initializer
    /// - Parameters:
    ///   - categories: categories array
    ///   - stores: stores array
    public init(categories: [CategoryStoreModel], stores: [CategoryStoreModel]) {
        self.categories = categories
        self.stores = stores
    }
}

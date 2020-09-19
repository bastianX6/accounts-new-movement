//
//  CategoryStoreModel.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import Foundation

/// Struct used to list categories and stores
public struct CategoryStoreModel: Identifiable, Codable {
    /// Category / Store name
    public let name: String

    /// Category / Store id
    public let id: UUID

    /// Default initializer
    /// - Parameters:
    ///   - name: category / Store name
    ///   - id: category / Store id
    public init(name: String, id: UUID) {
        self.name = name
        self.id = id
    }
}

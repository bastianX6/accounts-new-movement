//
//  CategoryStoreModel.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import Foundation

public struct CategoryStoreModel: Identifiable {
    public let name: String
    public let id: UUID

    public init(name: String, id: UUID) {
        self.name = name
        self.id = id
    }
}

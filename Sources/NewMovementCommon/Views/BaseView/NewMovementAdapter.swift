//
//  NewMovementAdapter.swift
//
//
//  Created by Bastián Véliz Vega on 12-12-20.
//

import DataManagement
import Foundation

public struct NewMovementAdapter: Movement {
    public let id: UUID
    public let name: String
    public let description: String
    public let amount: Float
    public let date: Date
    public let isPaid: Bool
    public let isPermanent: Bool
    public let storeId: UUID
    public let categoryId: UUID
    public let paymentId: UUID?

    public init(model: NewMovementViewInternalDataModel) {
        self.id = model.id
        self.name = model.title
        self.description = model.comments
        self.amount = model.amount.floatValue
        self.date = model.date
        self.isPaid = model.isPaid
        self.isPermanent = model.isPermanent
        self.storeId = model.currentStore
        self.categoryId = model.currentCategory
        self.paymentId = nil
    }
}

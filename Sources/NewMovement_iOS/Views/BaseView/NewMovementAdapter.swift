//
//  NewMovementAdapter.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import DataManagement
import Foundation

struct NewMovementAdapter: Movement {
    let id: UUID
    let name: String
    let description: String
    let amount: Float
    let date: Date
    let isPaid: Bool
    let isPermanent: Bool
    let storeId: UUID
    let categoryId: UUID
    let paymentId: UUID?

    init(model: NewMovementViewInternal.DataModel) {
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

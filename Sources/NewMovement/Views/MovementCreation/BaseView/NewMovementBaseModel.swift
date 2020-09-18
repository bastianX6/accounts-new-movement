//
//  NewMovementBaseModel.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import Combine
import DataManagement
import Foundation

class NewMovementBaseModel: ObservableObject {
    var id: UUID
    var title: String
    var date: Date
    var amount: NSNumber
    var comments: String
    var currentStore: UUID
    var currentCategory: UUID

    init(id: UUID = UUID(),
         title: String = "",
         date: Date = Date(),
         amount: NSNumber = 0,
         comments: String = "",
         currentStore: UUID,
         currentCategory: UUID) {
        self.id = id
        self.title = title
        self.date = date
        self.amount = amount
        self.comments = comments
        self.currentStore = currentStore
        self.currentCategory = currentCategory
    }

    convenience init(movement: Movement) {
        self.init(title: movement.name,
                  date: movement.date,
                  amount: NSNumber(value: movement.amount),
                  comments: movement.description,
                  currentStore: movement.storeId,
                  currentCategory: movement.categoryId)
    }
}

extension NewMovementBaseModel: CustomStringConvertible {
    var description: String {
        return "\n-title: \(self.title)" +
            "\n- date: \(self.date)" +
            "\n- amount: \(self.amount)" +
            "\n- comments: \(self.comments)" +
            "\n- store: \(self.currentStore)" +
            "\n- category: \(self.currentCategory)"
    }
}

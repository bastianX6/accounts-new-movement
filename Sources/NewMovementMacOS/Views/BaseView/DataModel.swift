//
//  DataModel.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import Combine
import DataManagement
import Foundation

extension NewMovementViewInternal {
    class DataModel: ObservableObject, CustomStringConvertible {
        var id: UUID
        var title: String
        var date: Date
        var amount: NSNumber
        var comments: String
        var isPaid: Bool
        var isPermanent: Bool
        var currentStore: UUID
        var currentCategory: UUID
        let isNew: Bool

        init(id: UUID = UUID(),
             title: String = "",
             date: Date = Date(),
             amount: NSNumber = 0,
             comments: String = "",
             isPaid: Bool = false,
             isPermanent: Bool = false,
             currentStore: UUID,
             currentCategory: UUID,
             isNew: Bool = true) {
            self.id = id
            self.title = title
            self.date = date
            self.amount = amount
            self.comments = comments
            self.isPaid = isPaid
            self.isPermanent = isPermanent
            self.currentStore = currentStore
            self.currentCategory = currentCategory
            self.isNew = isNew
        }

        convenience init(movement: Movement) {
            self.init(id: movement.id,
                      title: movement.name,
                      date: movement.date,
                      amount: NSNumber(value: movement.amount),
                      comments: movement.description,
                      isPaid: movement.isPaid,
                      isPermanent: movement.isPermanent,
                      currentStore: movement.storeId,
                      currentCategory: movement.categoryId,
                      isNew: false)
        }

        var description: String {
            return "\n-title: \(self.title)" +
                "\n- date: \(self.date)" +
                "\n- amount: \(self.amount)" +
                "\n- comments: \(self.comments)" +
                "\n- store: \(self.currentStore)" +
                "\n- category: \(self.currentCategory)"
        }
    }
}

//
//  NewMovementViewInternalDataModel.swift
//
//
//  Created by Bastián Véliz Vega on 12-12-20.
//

import Combine
import DataManagement
import Foundation

public class NewMovementViewInternalDataModel: ObservableObject, CustomStringConvertible {
    public var id: UUID
    public var title: String
    public var date: Date
    public var amount: NSNumber
    public var comments: String
    public var isPaid: Bool
    public var isPermanent: Bool
    public var currentStore: UUID
    public var currentCategory: UUID
    public let isNew: Bool

    public init(id: UUID = UUID(),
                title: String = "",
                date: Date = Date(),
                amount: NSNumber = 0,
                comments: String = "",
                isPaid: Bool = false,
                isPermanent: Bool = false,
                currentStore: UUID,
                currentCategory: UUID,
                isNew: Bool = true)
    {
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

    public convenience init(movement: Movement) {
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

    public var description: String {
        return "\n-title: \(self.title)" +
            "\n- date: \(self.date)" +
            "\n- amount: \(self.amount)" +
            "\n- comments: \(self.comments)" +
            "\n- store: \(self.currentStore)" +
            "\n- category: \(self.currentCategory)"
    }
}

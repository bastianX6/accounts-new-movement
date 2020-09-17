//
//  NewMovementBaseModel.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import Combine
import Foundation

class NewMovementBaseModel: ObservableObject {
    @Published var title: String
    @Published var date: Date
    @Published var amount: NSNumber
    @Published var comments: String

    init(title: String = "",
         date: Date = Date(),
         amount: NSNumber = 0,
         comments: String = "") {
        self.title = title
        self.date = date
        self.amount = amount
        self.comments = comments
    }
}

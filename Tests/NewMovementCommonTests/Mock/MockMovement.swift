//
//  MockMovement.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import DataManagement
import Foundation

struct MockMovement: Movement {
    var id = UUID()
    var name: String = ""
    var description: String = ""
    var amount: Float = 1
    var date = Date()
    var isPaid: Bool = false
    var isPermanent: Bool = false
    var storeId = UUID()
    var categoryId = UUID()
    var paymentId: UUID? = nil
}

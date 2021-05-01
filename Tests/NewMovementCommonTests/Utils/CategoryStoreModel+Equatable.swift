//
//  CategoryStoreModel+Equatable.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import AccountsUI
import Foundation

extension CategoryStoreModel: Equatable {
    public static func == (lhs: CategoryStoreModel, rhs: CategoryStoreModel) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.icon == rhs.icon &&
            lhs.color == rhs.color
    }
}

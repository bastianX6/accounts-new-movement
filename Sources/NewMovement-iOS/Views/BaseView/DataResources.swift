//
//  DataResources.swift
//
//
//  Created by Bastián Véliz Vega on 19-09-20.
//

import Foundation
import AccountsUI

extension NewMovementView {
    struct DataResources {
        let categories: [CategoryStoreModel]
        let stores: [CategoryStoreModel]
        let numberFormatter: NumberFormatter
        let customDataSectionTitle: String
        let isIncome: Bool

        init(categories: [CategoryStoreModel],
             stores: [CategoryStoreModel],
             customDataSectionTitle: String,
             isIncome: Bool = true,
             numberFormatter: NumberFormatter? = nil) {
            self.categories = categories
            self.stores = stores
            self.customDataSectionTitle = customDataSectionTitle
            self.isIncome = isIncome

            if let numberFormatter = numberFormatter {
                self.numberFormatter = numberFormatter
            } else {
                let formatter = NumberFormatter()
                formatter.numberStyle = .none
                formatter.locale = Locale(identifier: "es_CL")
                self.numberFormatter = formatter
            }
        }
    }
}



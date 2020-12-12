//
//  DataResources.swift
//
//
//  Created by Bastián Véliz Vega on 19-09-20.
//

import AccountsUI
import Foundation

public struct NewMovementViewInternalDataResources {
    public let categories: [CategoryStoreModel]
    public let stores: [CategoryStoreModel]
    public let numberFormatter: NumberFormatter
    public let customDataSectionTitle: String
    public let isIncome: Bool

    public init(categories: [CategoryStoreModel],
                stores: [CategoryStoreModel],
                customDataSectionTitle: String,
                isIncome: Bool = true,
                numberFormatter: NumberFormatter? = nil)
    {
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

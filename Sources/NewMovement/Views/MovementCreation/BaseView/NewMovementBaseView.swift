//
//  NewMovementBaseView.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import AccountsUI
import SwiftUI

@available(watchOS, unavailable)
@available(tvOS, unavailable)
struct NewMovementBaseView: View {
    @Binding var model: NewMovementBaseModel

    private let categories: [CategoryStoreModel]
    private let stores: [CategoryStoreModel]
    private let numberFormatter: NumberFormatter

    init(model: Binding<NewMovementBaseModel>,
         categories: [CategoryStoreModel],
         stores: [CategoryStoreModel],
         numberFormatter: NumberFormatter? = nil) {
        self._model = model
        self.categories = categories
        self.stores = stores
        if let numberFormatter = numberFormatter {
            self.numberFormatter = numberFormatter
        } else {
            let formatter = NumberFormatter()
            formatter.numberStyle = .none
            formatter.locale = Locale(identifier: "es_CL")
            self.numberFormatter = formatter
        }
    }

    var body: some View {
        Form {
            self.basicDataSection
            self.customDataSection
        }
    }

    private var basicDataSection: some View {
        Section(header:
            VStack(alignment: .leading) {
                Text(L10n.basicInformation.uppercased())
                    .font(.caption)
        }) {
            TextField(L10n.description,
                      text: self.$model.title)
            DateSelector(title: L10n.date, date: self.$model.date)
            TextField(L10n.amount,
                      value: self.$model.amount,
                      formatter: self.numberFormatter)
            TextField(L10n.comments,
                      text: self.$model.comments)
        }
    }

    private var customDataSection: some View {
        Section(header:
            VStack(alignment: .leading) {
                Text(L10n.expeditureDetails.uppercased())
                    .font(.caption)
        }) {
            Picker(selection: self.$model.currentCategory,
                   label: Text(L10n.category)) {
                ForEach(self.categories, id: \.id) { item in
                    Text(item.name)
                }
            }

            Picker(selection: self.$model.currentStore,
                   label: Text(L10n.storeCreditCard)) {
                ForEach(self.stores, id: \.id) { item in
                    Text(item.name)
                }
            }
        }
    }
}

struct NewMovementBaseView_Previews: PreviewProvider {
    @ObservedObject static var manager: NewMovementViewModel = DataPreview.viewModel

    static var previews: some View {
        Group {
            NewMovementBaseView(model: self.$manager.model,
                                categories: self.manager.categories,
                                stores: self.manager.stores)
                .environment(\.colorScheme, .light)

            NewMovementBaseView(model: self.$manager.model,
                                categories: self.manager.categories,
                                stores: self.manager.stores)
                .environment(\.colorScheme, .dark)

            NewMovementBaseView(model: self.$manager.model,
                                categories: self.manager.categories,
                                stores: self.manager.stores)
                .environment(\.colorScheme, .light)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
}

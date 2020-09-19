//
//  NewMovementView.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import AccountsUI
import SwiftUI

@available(watchOS, unavailable)
@available(tvOS, unavailable)
struct NewMovementView: View {
    @Binding var model: DataModel
    private let dataResources: DataResources

    init(model: Binding<DataModel>,
         dataResources: DataResources) {
        self._model = model

        self.dataResources = dataResources
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
                      formatter: self.dataResources.numberFormatter)
            TextField(L10n.comments,
                      text: self.$model.comments)
        }
    }

    private var customDataSection: some View {
        Section(header:
            VStack(alignment: .leading) {
                Text(self.dataResources.customDataSectionTitle.uppercased())
                    .font(.caption)
        }) {
            Picker(selection: self.$model.currentCategory,
                   label: Text(L10n.category)) {
                ForEach(self.dataResources.categories, id: \.id) { item in
                    Text(item.name)
                }
            }
            if !self.dataResources.isIncome {
                Picker(selection: self.$model.currentStore,
                       label: Text(L10n.storeCreditCard)) {
                    ForEach(self.dataResources.stores, id: \.id) { item in
                        Text(item.name)
                    }
                }
            }
        }
    }
}

struct NewMovementBaseView_Previews: PreviewProvider {
    @ObservedObject static var manager: NewMovementViewModel = DataPreview.viewModel

    static var previews: some View {
        Group {
            NewMovementView(model: self.$manager.model,
                            dataResources: DataPreview.baseViewDataModel(isIncome: true))
                .environment(\.colorScheme, .light)

            NewMovementView(model: self.$manager.model,
                            dataResources: DataPreview.baseViewDataModel(isIncome: false))
                .environment(\.colorScheme, .dark)

            NewMovementView(model: self.$manager.model,
                            dataResources: DataPreview.baseViewDataModel(isIncome: true))
                .environment(\.colorScheme, .light)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
}

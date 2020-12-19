//
//  NewMovementViewInternal.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import AccountsUI
import SwiftUI
import NewMovementCommon


struct NewMovementViewInternal: View {
    @Binding var model: NewMovementViewInternalDataModel
    private let dataResources: NewMovementViewInternalDataResources
    private var deleteAction: (() -> Void)?

    init(model: Binding<NewMovementViewInternalDataModel>,
         dataResources: NewMovementViewInternalDataResources,
         deleteAction: (() -> Void)? = nil) {
        self._model = model
        self.dataResources = dataResources
        self.deleteAction = deleteAction
    }

    private var permanentMovementTitle: String {
        return self.dataResources.isIncome ? L10n.permanentIncome : L10n.permanentExpenditure
    }

    var body: some View {
        Form {
            self.basicDataSection
            self.customDataSection
            if self.deleteAction != nil {
                self.deleteMovementSection
            }
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
                LabelSwitchView(title: L10n.isPaid, isOn: self.$model.isPaid)
            }
            LabelSwitchView(title: self.permanentMovementTitle,
                            isOn: self.$model.isPermanent)
        }
    }

    private var deleteMovementSection: some View {
        Button {
            self.deleteAction?()
        } label: {
            let title = self.dataResources.isIncome ? L10n.deleteIncome : L10n.deleteExpenditure
            Label(title, systemImage: "trash")
                .accentColor(.red)
        }
    }
}

struct NewMovementViewInternal_Previews: PreviewProvider {
    @ObservedObject static var manager: NewMovementViewModel = DataPreview.viewModel

    static var previews: some View {
        Group {
            NewMovementViewInternal(model: self.$manager.model,
                                    dataResources: DataPreview.baseViewDataModel(isIncome: true))
                .environment(\.colorScheme, .light)

            NewMovementViewInternal(model: self.$manager.model,
                                    dataResources: DataPreview.baseViewDataModel(isIncome: false))
                .environment(\.colorScheme, .dark)

            NewMovementViewInternal(model: self.$manager.model,
                                    dataResources: DataPreview.baseViewDataModel(isIncome: true))
                .environment(\.colorScheme, .light)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
}

//
//  NewMovementBaseView.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import AccountsUI
import SwiftUI

@available(watchOS,
           unavailable,
           message: "AddMovementBaseInfoView is not available in watchOS")
@available(tvOS,
           unavailable,
           message: "AddMovementBaseInfoView is not available in tvOS")
struct AddMovementBaseInfoView: View {
    @ObservedObject var model: NewMovementBaseModel

    private var numberFormatter: NumberFormatter

    init(model: NewMovementBaseModel,
         numberFormatter: NumberFormatter? = nil) {
        self.model = model
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
}

struct AddMovementBaseInfoView_Previews: PreviewProvider {
    @ObservedObject static var viewModel = NewMovementBaseModel()

    @ObservedObject static var viewModelWithData: NewMovementBaseModel = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let date = dateFormatter.date(from: "2018-02-02") ?? Date()

        let model = NewMovementBaseModel(title: "A title",
                                         date: date,
                                         amount: 150_000,
                                         comments: "Comments :)")
        return model
    }()

    static var previews: some View {
        Group {
            Form {
                AddMovementBaseInfoView(model: self.viewModelWithData)
            }
            .environment(\.colorScheme, .light)

            Form {
                AddMovementBaseInfoView(model: self.viewModelWithData)
            }
            .environment(\.colorScheme, .dark)

            Form {
                AddMovementBaseInfoView(model: self.viewModelWithData)
            }
            .environment(\.colorScheme, .light)
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
}

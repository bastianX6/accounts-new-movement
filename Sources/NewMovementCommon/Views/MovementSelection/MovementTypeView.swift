//
//  MovementTypeView.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import AccountsUI
import Combine
import SwiftUI

public struct MovementTypeView: View {
    @Environment(\.sizeCategory) var sizeCategory

    var expenditureAction: () -> Void
    var incomeAction: () -> Void

    public init(expenditureAction: @escaping () -> Void,
                incomeAction: @escaping () -> Void) {
        self.expenditureAction = expenditureAction
        self.incomeAction = incomeAction
    }

    public var body: some View {
        ScrollView {
            VStack {
                Text(L10n.whatDoYouWantToAdd)
                    .font(.title)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           alignment: .center)
                    .padding()

                VStack {
                    MovementTypeCard(systemImageName: "bag.fill.badge.minus",
                                     imageTintColor: .purple,
                                     title: L10n.expenditure)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               alignment: .center)
                        .padding()
                }
                .onTapGesture(perform: self.expenditureAction)
                VStack {
                    MovementTypeCard(systemImageName: "dollarsign.square.fill",
                                     imageTintColor: .indigo,
                                     title: L10n.income)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               alignment: .center)
                        .padding()
                }
                .onTapGesture(perform: self.incomeAction)
            }
        }
    }
}

struct MovementTypeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovementTypeView(expenditureAction: {}, incomeAction: {})
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .environment(\.locale, Locale(identifier: "es"))

            MovementTypeView(expenditureAction: {}, incomeAction: {})
                .environment(\.colorScheme, .light)

            MovementTypeView(expenditureAction: {}, incomeAction: {})
                .environment(\.sizeCategory, .large)

            MovementTypeView(expenditureAction: {}, incomeAction: {})
                .background(Color.systemGray6)
                .environment(\.colorScheme, .dark)
        }
    }
}

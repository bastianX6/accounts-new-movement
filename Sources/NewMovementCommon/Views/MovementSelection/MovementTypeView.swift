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

    var expeditureAction: () -> Void
    var incomeAction: () -> Void

    public init(expeditureAction: @escaping () -> Void,
                incomeAction: @escaping () -> Void) {
        self.expeditureAction = expeditureAction
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

                VStack {
                    MovementTypeCard(systemImageName: "bag.fill.badge.minus",
                                     imageTintColor: .purple,
                                     title: L10n.expedirure)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               alignment: .center)
                        .padding()
                }
                .onTapGesture(perform: self.expeditureAction)
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
            MovementTypeView(expeditureAction: {}, incomeAction: {})
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .environment(\.locale, Locale(identifier: "es"))

            MovementTypeView(expeditureAction: {}, incomeAction: {})
                .environment(\.colorScheme, .light)

            MovementTypeView(expeditureAction: {}, incomeAction: {})
                .environment(\.sizeCategory, .large)

            MovementTypeView(expeditureAction: {}, incomeAction: {})
                .background(Color.systemGray2)
                .environment(\.colorScheme, .dark)
        }
    }
}

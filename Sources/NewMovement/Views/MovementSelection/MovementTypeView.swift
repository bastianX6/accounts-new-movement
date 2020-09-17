//
//  MovementTypeView.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import AccountsUI
import Combine
import SwiftUI

struct MovementTypeView: View {
    @Environment(\.sizeCategory) var sizeCategory

    var body: some View {
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
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .center)
                VStack {
                    MovementTypeCard(systemImageName: "dollarsign.square.fill",
                                     imageTintColor: .indigo,
                                     title: L10n.income)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               alignment: .center)
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .center)
            }
        }
    }
}

struct MovementTypeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovementTypeView()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .environment(\.locale, Locale(identifier: "es"))

            MovementTypeView()
                .environment(\.colorScheme, .light)

            MovementTypeView()
                .environment(\.sizeCategory, .large)

            MovementTypeView()
                .background(Color.systemGray2)
                .environment(\.colorScheme, .dark)
        }
    }
}

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
                Text("¿Qué deseas agregar?")
                    .font(.title)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           alignment: .center)
                    .background(Color.systemBackground)

                VStack {
                    MovementTypeCard(systemImageName: "bag.fill.badge.minus",
                                     imageTintColor: .purple,
                                     title: "Gasto")
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               alignment: .center)
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .center)
                .background(Color.systemBackground)
                VStack {
                    MovementTypeCard(systemImageName: "dollarsign.square.fill",
                                     imageTintColor: .indigo,
                                     title: "Ingreso")
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               alignment: .center)
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .center)
                .background(Color.systemBackground)
            }
        }
    }
}

struct MovementTypeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovementTypeView()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)

            MovementTypeView()
                .environment(\.colorScheme, .light)

            MovementTypeView()
                .environment(\.sizeCategory, .large)

            MovementTypeView()
                .environment(\.colorScheme, .dark)
        }
    }
}

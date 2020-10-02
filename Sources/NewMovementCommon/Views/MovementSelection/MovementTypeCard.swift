//
//  MovementTypeCard.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import AccountsUI
import Foundation
import SwiftUI

struct MovementTypeCard: View {
    let systemImageName: String
    let imageTintColor: Color
    let title: String

    var body: some View {
        VStack(alignment: .center) {
            self.image
                .scaledToFit()
                .frame(minWidth: 0,
                       maxWidth: 45,
                       alignment: .center)
                .foregroundColor(self.imageTintColor)
            Text(self.title)
                .font(.title)
                .lineLimit(nil)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .center)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 3)
    }

    private var image: some View {
        return Image.resizableImage(systemName: self.systemImageName)
    }
}

struct MovementTypeCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                MovementTypeCard(systemImageName: "bag.fill.badge.minus",
                                 imageTintColor: .indigo,
                                 title: "Gasto con texto glfoñkfm")
            }
            .environment(\.sizeCategory, .large)
            .environment(\.colorScheme, .light)

            VStack {
                MovementTypeCard(systemImageName: "bag.fill.badge.minus",
                                 imageTintColor: .indigo,
                                 title: "Gasto con texto glfoñkfm")
            }
            .background(Color.systemGray6)
            .environment(\.sizeCategory, .large)
            .environment(\.colorScheme, .dark)
        }
    }
}

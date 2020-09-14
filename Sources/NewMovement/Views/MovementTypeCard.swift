//
//  MovementTypeCard.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import Foundation
import SwiftUI

@available(
    watchOS,
    unavailable,
    message: "MovementTypeCard is not available in watchOS"
)
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
        .background(Color.systemBackground)
        .cornerRadius(10)
        .shadow(radius: 3)
    }

    private var image: some View {
        #if os(macOS)
            if #available(macOS 11, *) {
                return AnyView(Image(systemName: self.systemImageName)
                    .resizable())
            } else {
                return AnyView(Rectangle())
            }

        #else
            return Image(systemName: self.systemImageName)
                .resizable()
        #endif
    }
}

struct MovementTypeCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                MovementTypeCard(systemImageName: "bag.fill.badge.minus",
                                 imageTintColor: Color.indigo,
                                 title: "Gasto con texto glfoñkfm")
            }
            .environment(\.sizeCategory, .large)
            .environment(\.colorScheme, .dark)
        }
    }
}

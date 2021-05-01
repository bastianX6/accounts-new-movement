//
//  MovementTypeViewTests.swift
//
//
//  Created by Bastián Véliz Vega on 19-12-20.
//

import Foundation

@testable import NewMovementCommon
import Nimble
import Quick
import SnapshotTesting
import SnapshotTesting_Nimble
import SwiftUI
import XCTest

final class MovementTypeViewTests: QuickSpec {
    private let referenceSize = CGSize(width: 400, height: 500)

    override func spec() {
        var view: AnyView!

        describe("MovementTypeView") {
            beforeEach {
                view = MovementTypeView(expenditureAction: {}, incomeAction: {})
                    .frameFromSize(self.referenceSize)
                    .eraseToAnyView()
            }

            context("when view is created") {
                it("should have the correct layout") {
                    expect(view).to(haveValidSnapshot(as: .image(size: self.referenceSize)))
                }

                it("should have the correct layout on dark mode") {
                    view = view
                        .background(Color.systemGray6)
                        .environment(\.colorScheme, .dark)
                        .eraseToAnyView()
                    expect(view).to(haveValidSnapshot(as: .image(size: self.referenceSize)))
                }
            }
        }
    }
}

private extension SwiftUI.View {
    func frameFromSize(_ size: CGSize) -> some View {
        frame(width: size.width, height: size.height)
    }
}

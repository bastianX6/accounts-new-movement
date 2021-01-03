//
//  MovementTypeCardTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import Foundation
import Nimble
import Quick
import SnapshotTesting
import SnapshotTesting_Nimble
import SwiftUI
import XCTest

@testable import NewMovementCommon

final class MovementTypeCardTests: QuickSpec {
    private let referenceSize = CGSize(width: 300, height: 100)

    override func spec() {
        var view: AnyView!

        describe("MovementTypeCard") {
            beforeEach {
                view = MovementTypeCard(systemImageName: "paperplane.fill",
                                        imageTintColor: .indigo,
                                        title: "A title")
                    .eraseToAnyView()
            }

            context("when view is created") {
                it("should have the correct layout") {
                    view = view
                        .environment(\.colorScheme, .light)
                        .eraseToAnyView()
                    expect(view).to(haveValidSnapshot(as: .image(size: self.referenceSize)))
                }

                it("should have the correct layout on dark mode") {
                    view = view
                        .environment(\.colorScheme, .dark)
                        .eraseToAnyView()
                    expect(view).to(haveValidSnapshot(as: .image(size: self.referenceSize)))
                }
            }
        }
    }
}

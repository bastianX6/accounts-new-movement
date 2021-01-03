//
//  MovementTypeSelectorViewTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import AccountsUI
import Foundation
import NewMovementCommon
import Nimble
import Quick
import SnapshotTesting
import SnapshotTesting_Nimble
import SwiftUI

@testable import NewMovement_iOS

class MovementTypeSelectorViewTests: QuickSpec {
    private let referenceSize = ViewImageConfig.iPhoneX.size!

    override func spec() {
        var sut: AnyView!

        describe("MovementTypeSelectorView") {
            beforeEach {
                let dataSource = MovementPreview()
                let dataModel = NewMovementViewDataModel(dataSource: dataSource,
                                                         incomeData: DataPreview.incomeData,
                                                         expenditureData: DataPreview.expenditureData)
                sut = MovementTypeSelectorView(dataModel: dataModel)
                    .frameFromSize(self.referenceSize)
                    .eraseToAnyView()
            }

            context("when view is created") {
                it("should have the correct layout") {
                    sut = sut
                        .environment(\.colorScheme, .light)
                        .eraseToAnyView()
                    expect(sut).to(haveValidSnapshot(as: .image))
                }

                it("should have the correct layout on dark mode") {
                    sut = sut
                        .background(Color.systemGray6)
                        .environment(\.colorScheme, .dark)
                        .eraseToAnyView()
                    expect(sut).to(haveValidSnapshot(as: .image))
                }
            }
        }
    }
}

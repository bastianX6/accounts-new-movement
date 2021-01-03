//
//  NewMovementViewTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import AccountsUI
import DependencyResolver
import Foundation
import NewMovementCommon
import Nimble
import Quick
import SnapshotTesting
import SnapshotTesting_Nimble
import SwiftUI

@testable import NewMovement_iOS

class NewMovementViewTests: QuickSpec {
    private let referenceSize = ViewImageConfig.iPhoneX.size!

    override func spec() {
        var sut: AnyView!
        var resolver: DependencyResolver!

        describe("NewMovementView") {
            beforeEach {
                resolver = DependencyResolver(bundle: Bundle.main)
            }

            context("when view is created") {
                context("and isIncome is true") {
                    beforeEach {
                        let dataSource = MovementPreview()
                        let movement = DataPreview.movement
                        let dataModel = NewMovementViewDataModel(dataSource: dataSource,
                                                                 incomeData: DataPreview.incomeData,
                                                                 expenditureData: DataPreview.expenditureData)
                        sut = NewMovementView(dataModel: dataModel,
                                              movement: movement,
                                              isIncome: true,
                                              onEnd: {})
                            .frameFromSize(self.referenceSize)
                            .environmentObject(resolver)
                            .eraseToAnyView()
                    }
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

                context("and isIncome is false") {
                    beforeEach {
                        let dataSource = MovementPreview()
                        let movement = DataPreview.movement
                        let dataModel = NewMovementViewDataModel(dataSource: dataSource,
                                                                 incomeData: DataPreview.incomeData,
                                                                 expenditureData: DataPreview.expenditureData)
                        sut = NewMovementView(dataModel: dataModel,
                                              movement: movement,
                                              isIncome: false,
                                              onEnd: {})
                            .frameFromSize(self.referenceSize)
                            .environmentObject(resolver)
                            .eraseToAnyView()
                    }
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
}

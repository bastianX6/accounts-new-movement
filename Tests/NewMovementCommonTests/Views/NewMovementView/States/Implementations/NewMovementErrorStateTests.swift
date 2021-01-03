//
//  NewMovementErrorStateTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import Nimble
import Quick

@testable import NewMovementCommon

class NewMovementErrorStateTests: QuickSpec {
    override func spec() {
        var sut: NewMovementErrorState!

        describe("NewMovementErrorState") {
            context("when init a new instance") {
                it("should have the right values") {
                    sut = NewMovementErrorState(viewModel: nil)

                    expect(sut.isIncome).to(beFalse())
                    expect(sut.showLoading).to(beFalse())
                    expect(sut.isEdition).to(beFalse())
                    expect(sut.showDeleteAlert).to(beFalse())
                    expect(sut.error).to(beNil())
                    expect(sut.navigationBarTitle) == L10n.newExpenditure
                    expect(sut.movementDetailTitle) == L10n.expenditureDetails
                }

                context("and is income is true") {
                    beforeEach {
                        sut = NewMovementErrorState(viewModel: nil)
                        sut.isIncome = true
                    }
                    it("should have the right navigation bar title if is edition is false") {
                        expect(sut.navigationBarTitle) == L10n.newIncome
                    }

                    it("should have the right navigation bar title if is edition is true") {
                        sut.isEdition = true
                        expect(sut.navigationBarTitle) == L10n.editIncome
                    }

                    it("should have the right movement detail title") {
                        expect(sut.movementDetailTitle) == L10n.incomeDetails
                    }
                }

                context("and is income is false") {
                    beforeEach {
                        sut = NewMovementErrorState(viewModel: nil)
                    }
                    it("should have the right navigation bar title if is edition is false") {
                        expect(sut.navigationBarTitle) == L10n.newExpenditure
                    }

                    it("should have the right navigation bar title if is edition is true") {
                        sut.isEdition = true
                        expect(sut.navigationBarTitle) == L10n.editExpenditure
                    }

                    it("should have the right movement detail title") {
                        expect(sut.movementDetailTitle) == L10n.expenditureDetails
                    }
                }
            }

            context("when cancelAction is called") {
                it("should change state in view model") {
                    let dataSource = MovementPreview()
                    let mockViewModel = MockNewMovementViewModel(dataSource: dataSource,
                                                                 incomeData: DataPreview.incomeData,
                                                                 expenditureData: DataPreview.expenditureData,
                                                                 onEnd: {})

                    sut = NewMovementErrorState(viewModel: mockViewModel)

                    sut.cancelAction()
                    expect(mockViewModel.currentStateEnum.representation) == NewMovementViewStateEnum.end.representation
                }
            }
        }
    }
}

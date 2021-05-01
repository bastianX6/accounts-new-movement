//
//  NewMovementDeletingStateTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import Nimble
import Quick

@testable import NewMovementCommon

class NewMovementDeletingStateTests: QuickSpec {
    override func spec() {
        var sut: NewMovementDeletingState!

        describe("NewMovementDeletingState") {
            context("when init a new instance") {
                it("should have the right values") {
                    sut = NewMovementDeletingState(viewModel: nil)

                    expect(sut.isIncome).to(beFalse())
                    expect(sut.showLoading).to(beTrue())
                    expect(sut.isEdition).to(beFalse())
                    expect(sut.showDeleteAlert).to(beFalse())
                    expect(sut.error).to(beNil())
                    expect(sut.navigationBarTitle) == L10n.newExpenditure
                    expect(sut.movementDetailTitle) == L10n.expenditureDetails
                }

                context("and is income is true") {
                    beforeEach {
                        sut = NewMovementDeletingState(viewModel: nil)
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
                        sut = NewMovementDeletingState(viewModel: nil)
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
            context("when deleteAction is called") {
                it("should set end state in view model if deletion was successful") {
                    let dataSource = MovementPreview()
                    let mockViewModel = MockNewMovementViewModel(dataSource: dataSource,
                                                                 incomeData: DataPreview.incomeData,
                                                                 expenditureData: DataPreview.expenditureData,
                                                                 onEnd: {})

                    sut = NewMovementDeletingState(viewModel: mockViewModel)

                    sut.deleteAction()

                    expect(mockViewModel.currentStateEnum.representation).toEventually(be(NewMovementViewStateEnum.end.representation))
                }

                it("should set error state in view model if deletion fails") {
                    let dataSource = MovementPreview()
                    dataSource.deleteSuccess = false
                    let mockViewModel = MockNewMovementViewModel(dataSource: dataSource,
                                                                 incomeData: DataPreview.incomeData,
                                                                 expenditureData: DataPreview.expenditureData,
                                                                 onEnd: {})

                    sut = NewMovementDeletingState(viewModel: mockViewModel)

                    sut.deleteAction()

                    expect(mockViewModel.currentStateEnum.representation).toEventually(be(NewMovementViewStateEnum.error(error: nil).representation))
                }
            }
        }
    }
}

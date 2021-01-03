//
//  NewMovementViewModelTests.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import AccountsUI
import Combine
import Foundation
import Nimble
import Quick

@testable import NewMovementCommon

class NewMovementViewModelTests: QuickSpec {
    override func spec() {
        var sut: NewMovementViewModel!
        var mockDataSource: MovementPreview!
        var incomeData: MovementResources!
        var expenditureData: MovementResources!

        describe("NewMovementViewModel") {
            beforeEach {
                mockDataSource = MovementPreview()
                incomeData = DataPreview.incomeData
                expenditureData = DataPreview.expenditureData
                sut = NewMovementViewModel(dataSource: mockDataSource,
                                           incomeData: incomeData,
                                           expenditureData:
                                           expenditureData,
                                           onEnd: {})
            }

            context("when init a new instance") {
                it("should have the right values") {
                    expect(sut.isIncome).to(beFalse())
                    expect(sut.isEdition).to(beFalse())
                    expect(sut.state).to(beAnInstanceOf(NewMovementViewBaseState.self))
                    expect(sut.state.isIncome).to(beFalse())
                    expect(sut.stores) == expenditureData.stores
                    expect(sut.categories) == expenditureData.categories
                }
            }

            context("when update isIncome value") {
                it("should update that value in current state") {
                    sut.isIncome = true
                    expect(sut.isIncome).to(beTrue())
                    expect(sut.state).to(beAnInstanceOf(NewMovementViewBaseState.self))
                    expect(sut.stores) == incomeData.stores
                    expect(sut.categories) == incomeData.categories
                    expect(sut.state.isIncome).to(beTrue())
                }
            }

            context("when update isEdition value") {
                it("should update that value in current state") {
                    sut.isEdition = true
                    expect(sut.state.isEdition).to(beTrue())
                }
            }

            context("when setState is called") {
                it("the current state should be a NewMovementSavingState instance if event is saving") {
                    sut.setState(.saving)
                    expect(sut.state).to(beAnInstanceOf(NewMovementSavingState.self))
                }

                it("the current state should be a NewMovementErrorState instance if event is error") {
                    sut.setState(.error(error: nil))
                    expect(sut.state).to(beAnInstanceOf(NewMovementErrorState.self))
                }

                it("the current state should be a NewMovementEndState instance if event is end") {
                    sut.setState(.end)
                    expect(sut.state).to(beAnInstanceOf(NewMovementEndState.self))
                }

                it("the current state should be a NewMovementEndState instance if event is askingForDelete") {
                    sut.setState(.askingForDelete)
                    expect(sut.state).to(beAnInstanceOf(NewMovementAskingForDeleteState.self))
                }

                it("the current state should be a NewMovementDeletingState instance if event is deleting") {
                    sut.setState(.deleting)
                    expect(sut.state).to(beAnInstanceOf(NewMovementDeletingState.self))
                }
            }

            context("when saveMovement is called") {
                context("and the movement is new") {
                    it("should set the end state if save action was successful") {
                        sut.setState(.saving)
                        expect(mockDataSource.saveCalled).toEventually(beTrue())
                        expect(sut.state).toEventually(beAnInstanceOf(NewMovementEndState.self))
                    }

                    it("should set the error state if save action fails") {
                        mockDataSource.saveSuccess = false
                        sut.setState(.saving)
                        expect(mockDataSource.saveCalled).toEventually(beTrue())
                        expect(sut.state).toEventually(beAnInstanceOf(NewMovementErrorState.self))
                    }
                }

                context("and a movement is edited") {
                    beforeEach {
                        let model = NewMovementViewInternalDataModel(currentStore: expenditureData.stores.first?.id ?? UUID(),
                                                                     currentCategory: expenditureData.categories.first?.id ?? UUID(),
                                                                     isNew: false)

                        sut = NewMovementViewModel(model: model,
                                                   dataSource: mockDataSource,
                                                   incomeData: incomeData,
                                                   expenditureData:
                                                   expenditureData,
                                                   onEnd: {})
                    }

                    it("should set the end state if update action was successful") {
                        sut.setState(.saving)
                        expect(mockDataSource.updateCalled).toEventually(beTrue())
                        expect(sut.state).toEventually(beAnInstanceOf(NewMovementEndState.self))
                    }

                    it("should set the error state if update action fails") {
                        mockDataSource.updateSuccess = false
                        sut.setState(.saving)
                        expect(mockDataSource.updateCalled).toEventually(beTrue())
                        expect(sut.state).toEventually(beAnInstanceOf(NewMovementErrorState.self))
                    }
                }
            }

            context("when deleteMovement is called") {
                it("should set the end state if delete action was successful") {
                    sut.setState(.deleting)
                    expect(mockDataSource.deleteCalled).toEventually(beTrue())
                    expect(sut.state).toEventually(beAnInstanceOf(NewMovementEndState.self))
                }

                it("should set the error state if delete action fails") {
                    mockDataSource.deleteSuccess = false
                    sut.setState(.deleting)
                    expect(mockDataSource.deleteCalled).toEventually(beTrue())
                    expect(sut.state).toEventually(beAnInstanceOf(NewMovementErrorState.self))
                }
            }
        }
    }
}

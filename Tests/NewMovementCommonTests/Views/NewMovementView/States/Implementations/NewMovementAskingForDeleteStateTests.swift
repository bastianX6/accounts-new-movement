//
//  NewMovementAskingForDeleteStateTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import Nimble
import Quick

@testable import NewMovementCommon

class NewMovementAskingForDeleteStateTests: QuickSpec {
    override func spec() {
        var sut: NewMovementAskingForDeleteState!

        describe("NewMovementAskingForDeleteState") {
            context("when init a new instance") {
                it("should have the right values") {
                    sut = NewMovementAskingForDeleteState()

                    expect(sut.isIncome).to(beFalse())
                    expect(sut.showLoading).to(beFalse())
                    expect(sut.isEdition).to(beFalse())
                    expect(sut.showDeleteAlert).to(beTrue())
                    expect(sut.error).to(beNil())
                    expect(sut.navigationBarTitle) == L10n.newExpenditure
                    expect(sut.movementDetailTitle) == L10n.expenditureDetails
                }

                context("and is income is true") {
                    beforeEach {
                        sut = NewMovementAskingForDeleteState()
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
                        sut = NewMovementAskingForDeleteState()
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
        }
    }
}

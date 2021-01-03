//
//  NewMovementViewInternalDataModelTests.swift
//
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation
import Nimble
import Quick

@testable import NewMovementCommon

class NewMovementViewInternalDataModelTests: QuickSpec {
    override func spec() {
        var sut: NewMovementViewInternalDataModel!

        describe("NewMovementViewInternalDataModel") {
            context("when init a new instance") {
                it("should have the right values when it is built using the default initializer") {
                    let id = UUID()
                    let title: String = ""
                    let date = Date()
                    let amount: NSNumber = 1000
                    let comments: String = ""
                    let isPaid: Bool = false
                    let isPermanent: Bool = false
                    let currentStore = UUID()
                    let currentCategory = UUID()
                    let isNew: Bool = true

                    sut = NewMovementViewInternalDataModel(id: id,
                                                           title: title,
                                                           date: date,
                                                           amount: amount,
                                                           comments: comments,
                                                           isPaid: isPaid,
                                                           isPermanent: isPermanent,
                                                           currentStore: currentStore,
                                                           currentCategory: currentCategory,
                                                           isNew: isNew)

                    expect(sut.id) == id
                    expect(sut.title) == title
                    expect(sut.date) == date
                    expect(sut.amount) == amount
                    expect(sut.comments) == comments
                    expect(sut.isPaid) == isPaid
                    expect(sut.isPermanent) == isPermanent
                    expect(sut.currentStore) == currentStore
                    expect(sut.currentCategory) == currentCategory
                    expect(sut.isNew) == isNew
                }

                it("should have the right values when it is built using the convenience initializer") {
                    let movement = MockMovement()

                    sut = NewMovementViewInternalDataModel(movement: movement)

                    expect(sut.id) == movement.id
                    expect(sut.title) == movement.name
                    expect(sut.date) == movement.date
                    expect(sut.amount) == NSNumber(value: movement.amount)
                    expect(sut.comments) == movement.description
                    expect(sut.isPaid) == movement.isPaid
                    expect(sut.isPermanent) == movement.isPermanent
                    expect(sut.currentStore) == movement.storeId
                    expect(sut.currentCategory) == movement.categoryId
                    expect(sut.isNew).to(beFalse())
                }
            }
        }
    }
}

//
//  NewMovementInitialState.swift
//
//
//  Created by Bastián Véliz Vega on 01-10-20.
//

import Foundation

class NewMovementInitialState: NewMovementViewState {
    var isIncome: Bool = false
    var showSheet: Bool = false
    let showLoading: Bool = false
    let navigationBarTitle: String = ""
    let movementDetailTitle: String = ""
    func saveAction() {}
    func cancelAction() {}
}

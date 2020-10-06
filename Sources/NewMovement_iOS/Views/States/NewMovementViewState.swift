//
//  NewMovementViewState.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import Combine
import Foundation

// MARK: - State definition

enum NewMovementViewStateEnum {
    case initial
    case showSheet(isIncome: Bool)
    case saving
    case error
}

protocol NewMovementViewState: AnyObject {
    var isIncome: Bool { get set }
    var showSheet: Bool { get set }
    var showLoading: Bool { get }
    var navigationBarTitle: String { get }
    var movementDetailTitle: String { get }

    func saveAction()
    func cancelAction()
}

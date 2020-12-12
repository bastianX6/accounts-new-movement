//
//  NewMovementViewState.swift
//
//
//  Created by Bastián Véliz Vega on 18-09-20.
//

import Combine
import Foundation

// MARK: - State definition

public enum NewMovementViewStateEnum {
    case saving
    case askingForDelete
    case deleting
    case error(error: Error?)
    case end
}

public protocol NewMovementViewState: AnyObject {
    var isIncome: Bool { get set }
    var showLoading: Bool { get }
    var isEdition: Bool { get set }
    var showDeleteAlert: Bool { get set }
    var navigationBarTitle: String { get }
    var movementDetailTitle: String { get }
    var error: Error? { get set }

    func saveAction()
    func cancelAction()
    func deleteAction()
    func endAction()
}

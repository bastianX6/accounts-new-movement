//
//  NewMovementViewStateEnum+String.swift
//
//
//  Created by Bastián Véliz Vega on 03-01-21.
//

import Foundation

@testable import NewMovementCommon

extension NewMovementViewStateEnum {
    var representation: String {
        switch self {
        case .saving:
            return "saving"
        case .askingForDelete:
            return "askingForDelete"
        case .deleting:
            return "deleting"
        case .error:
            return "error"
        case .end:
            return "end"
        }
    }
}

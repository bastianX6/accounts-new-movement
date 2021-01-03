//
//  MockNewMovementViewModel.swift
//  
//
//  Created by Bastián Véliz Vega on 02-01-21.
//

import Foundation

@testable import NewMovementCommon


class MockNewMovementViewModel: NewMovementViewModel {
    var currentStateEnum: NewMovementViewStateEnum = .askingForDelete
    
    
    override func setState(_ state: NewMovementViewStateEnum) {
        self.currentStateEnum = state
        super.setState(state)
    }
    
}

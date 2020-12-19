//
//  NewMovementAskingForDeleteState.swift
//
//
//  Created by Bastián Véliz Vega on 18-10-20.
//

import Foundation

public class NewMovementAskingForDeleteState: NewMovementViewBaseState {
    override public init() {
        super.init()
        self.showDeleteAlert = true
    }
}

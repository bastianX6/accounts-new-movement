//
//  NewMovementAskingForDeleteState.swift
//
//
//  Created by Bastián Véliz Vega on 18-10-20.
//

import Foundation

class NewMovementAskingForDeleteState: NewMovementViewBaseState {
    override init() {
        super.init()
        self.showDeleteAlert = true
    }
}

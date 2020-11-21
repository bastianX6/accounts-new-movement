//
//  NewMovementEndState.swift
//
//
//  Created by Bastián Véliz Vega on 01-10-20.
//

import Foundation

class NewMovementEndState: NewMovementViewBaseState {
    var onEnd: (() -> Void)?

    override func endAction() {
        self.onEnd?()
    }
}

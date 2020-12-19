//
//  NewMovementEndState.swift
//
//
//  Created by Bastián Véliz Vega on 01-10-20.
//

import Foundation

public class NewMovementEndState: NewMovementViewBaseState {
    public var onEnd: (() -> Void)?

    override public init() {}

    override public func endAction() {
        self.onEnd?()
    }
}

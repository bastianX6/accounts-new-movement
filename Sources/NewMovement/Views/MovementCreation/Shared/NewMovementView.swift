//
//  NewMovementView.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import SwiftUI

public struct NewMovementView: View {
    public init() {}
    public var body: some View {
        #if os(iOS)
            NewMovementViewiOS()
        #else
            Text("Hello, World!")
        #endif
    }
}

struct NewMovementView_Previews: PreviewProvider {
    static var previews: some View {
        NewMovementView()
    }
}

//
//  Color+Background.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import Foundation

#if !os(macOS)
    import UIKit
#else
    import AppKit
#endif
import SwiftUI

public extension Color {
    static let systemBackground: Color = {
        #if !os(macOS)
            return Color(UIColor.systemBackground)
        #else
            return Color(NSColor.windowBackgroundColor)
        #endif
    }()

    static let indigo: Color = {
        #if !os(macOS)
            return Color(UIColor.systemIndigo)
        #else
            return Color(NSColor.systemIndigo)
        #endif
    }()
}

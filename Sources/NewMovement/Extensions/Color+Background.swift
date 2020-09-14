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
        #if os(iOS)
            return Color(UIColor.systemBackground)
        #elseif os(watchOS)
            return .accentColor
        #elseif os(tvOS)
            return .secondary
        #else
            return Color(NSColor.windowBackgroundColor)
        #endif
    }()

    static let indigo: Color = {
        #if os(iOS) || os(tvOS)
            return Color(UIColor.systemIndigo)
        #elseif os(watchOS)
            return .accentColor
        #else
            return Color(NSColor.systemIndigo)
        #endif
    }()
}

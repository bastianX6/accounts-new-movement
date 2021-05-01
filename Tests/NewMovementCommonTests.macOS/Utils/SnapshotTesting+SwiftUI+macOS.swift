//
//  SnapshotTesting+SwiftUI+macOS.swift
//
//
//  Created by Bastián Véliz Vega on 19-12-20.
//

#if canImport(AppKit)
import AppKit
import Foundation
import SnapshotTesting
import SwiftUI

extension Snapshotting where Value: SwiftUI.View, Format == NSImage {
    static func image(precision: Float = 1,
                      size: CGSize) -> Snapshotting
    {
        Snapshotting<NSViewController, NSImage>.image(
            precision: precision,
            size: size
        )
        .pullback(NSHostingController.init(rootView:))
    }
}
#endif

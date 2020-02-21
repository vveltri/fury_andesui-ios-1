//
//  AndesIconsProvider.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 2/19/20.
//

import Foundation
@objc public class AndesIconsProvider: NSObject {
    // In the future this can be changed to public and allow a strategy injection, and allow private implementations of the strategy
    internal static var strategy: AndesIconsStrategy = AndesIconsLocalStrategy()

    @objc static func loadIcon(name: String, success: (UIImage?) -> Void) {
        strategy.loadIcon(name: name, success: success, failure: nil)
    }

    @objc static func loadIcon(name: String, success: (UIImage?) -> Void, failure: @escaping (Error?) -> Void) {
        strategy.loadIcon(name: name, success: success, failure: failure)
    }

    @objc static func loadIcon(name: String, placeItInto: UIImageView) {
        strategy.loadIcon(name: name, success: {
            if let img = $0 {
                placeItInto.image = img
            }
        }, failure: nil)
    }

    @objc static func loadIcon(name: String, placeItInto: UIImageView, failure: @escaping (Error?) -> Void) {
        strategy.loadIcon(name: name, success: {
            if let img = $0 {
                placeItInto.image = img
            }
        }, failure: failure)
    }
}

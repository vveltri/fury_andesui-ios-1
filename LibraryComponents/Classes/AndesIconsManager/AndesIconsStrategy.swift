//
//  AndesIconsStrategy.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 2/19/20.
//

import Foundation

@objc public protocol AndesIconsStrategy {
    func loadIcon(name: String, success: (UIImage?) -> Void, failure: ((Error?) -> Void)?)
}

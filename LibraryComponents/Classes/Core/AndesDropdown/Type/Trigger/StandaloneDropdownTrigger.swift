//
//  StandaloneCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public class StandaloneDropdownTrigger: AndesDropdownTrigger {
    public private(set) var size: AndesTextSize
    @objc public init(size: AndesTextSize = .medium) {
        self.size = size
        super.init(type: .standalone)
    }
}

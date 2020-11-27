//
//  AndesDropdownCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public class AndesDropdownCell: NSObject {
    var title: String
    var image: AndesThumbnail?

    public init(title: String, image: AndesThumbnail? = nil) {
        self.title = title
        self.image = image
    }
}

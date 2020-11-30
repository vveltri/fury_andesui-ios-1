//
//  File.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/11/20.
//

import Foundation

@objc public class AndesDropDownMenuCell: NSObject {
    public private(set) var title: String
    public private(set) var thumbnail: AndesThumbnail?

    public init(title: String, thumbnail: AndesThumbnail? = nil) {
        self.title = title
        self.thumbnail = thumbnail
    }
}

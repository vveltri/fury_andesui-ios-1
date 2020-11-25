//
//  AndesThumbnailSizeExtension.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 25/11/20.
//

import Foundation

extension AndesThumbnailSize {

    public static func floatToAndesThumbnailSize(value: CGFloat) -> AndesThumbnailSize {
        for size in self.allCases {
            if size.toString().stringToFloat() == value {
                return size
            }
        }
        return .size40
    }

}

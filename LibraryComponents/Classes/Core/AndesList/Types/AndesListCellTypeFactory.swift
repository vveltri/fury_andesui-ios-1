//
//  AndesListCellTypeFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 5/11/20.
//

import Foundation

class AndesListCellTypeFactory {
    static func provideType(withSize size: AndesListSize, thumbnail: AndesThumbnail? = nil) -> AndesListCellTypeProtocol {
        switch size {
        case .large:
            return AndesListCellLargeType(thumbnail: thumbnail)
        case .small:
            return AndesListCellSmallType(withThumbnail: thumbnail)
        case .medium:
            return AndesListCellMediumType(thumbnail: thumbnail)
        }
    }
}

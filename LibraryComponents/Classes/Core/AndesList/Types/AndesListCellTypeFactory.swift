//
//  AndesListCellSizeFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

class AndesListCellTypeFactory {
    static func provide(withSize size: AndesListSize,
                        subTitle: Bool, thumbnail: AndesThumbnail? = nil) -> AndesListCellTypeProtocol {

        switch size {
        case .large:
            return AndesListCellLargeType(withDescription: subTitle, thumbnail: thumbnail)
        case .small:
            return AndesListCellSmallType(withThumbnail: thumbnail)
        case .medium:
            return AndesListCellMediumType(withDescription: subTitle, thumbnail: thumbnail)
        }
    }
}

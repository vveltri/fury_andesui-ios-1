//
//  AndesListViewCellSizeFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

class AndesListViewCellTypeFactory {
    static func provide(withSize size: AndesListSize,
                        subTitle: Bool, thumbnail: AndesThumbnail? = nil) -> AndesListViewCellTypeProtocol {

        switch size {
        case .large:
            return AndesListViewCellLargeType(withDescription: subTitle, thumbnail: thumbnail)
        case .small:
            return AndesListViewCellSmallType(withThumbnail: thumbnail)
        case .medium:
            return AndesListViewCellMediumType(withDescription: subTitle, thumbnail: thumbnail)
        }
    }
}

//
//  AndesListViewCellSizeFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

class AndesListViewCellTypeFactory {
    static func provide(withSize size: AndesListSize, hasDescription: Bool) -> AndesListViewCellTypeProtocol {
        switch size {
        case .large:
            return AndesListViewCellLargeType(withDescription: hasDescription)
        case .small:
            return AndesListViewCellSmallType()
        case .medium:
            return AndesListViewCellMediumType(withDescription: hasDescription)
        }
    }
}

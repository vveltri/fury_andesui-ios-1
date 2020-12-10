//
//  AndesProgressIndicatorSizeXXSmall.swift
//  AndesUI
//
//  Created by Juan Andres Vasquez Ferrer on 10-12-20.
//

import Foundation

internal struct AndesProgressIndicatorSizeXXSmall: AndesProgressIndicatorSizeProtocol {
    var textSpacing: CGFloat = 12
    var strokeWidth: CGFloat = 2
    var height: CGFloat = 12
    var horizontalDistribution: Bool = true

    var textFont: UIFont = AndesStyleSheetManager.styleSheet.regularSystemFont(size: 14)

}

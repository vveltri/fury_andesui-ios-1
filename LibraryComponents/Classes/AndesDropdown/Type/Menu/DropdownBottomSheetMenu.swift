//
//  DropdownBottomSheetType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public class DropdownBottomSheetMenu: AndesDropdownMenu {
    public var separatorStyle: AndesSeparatorStyle

    @objc public init(separatorStyle: AndesSeparatorStyle = .none,
                      numberOfLines: Int = 0,
                      rows: [AndesDropDownMenuCell],
                      selectionStyle: AndesSelectionStyle = .defaultStyle) {
        self.separatorStyle = separatorStyle
        super.init(numberOfLines: numberOfLines,
                   rows: rows,
                   selectionStyle: selectionStyle,
                   cellType: .none,
                   type: .bottomSheet)
    }

}

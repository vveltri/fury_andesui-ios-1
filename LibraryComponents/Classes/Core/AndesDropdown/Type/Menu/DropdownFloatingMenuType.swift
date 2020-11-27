//
//  DropdownFloatingMenuType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public class DropdownFloatingMenuType: AndesDropdownMenu {
    public init(numberOfLines: Int = 0,
                         rows: [AndesDropDownMenuCellType],
                         selectionStyle: AndesSelectionStyle,
                         cellType: AndesDropdownCellType) {

        super.init(numberOfLines: numberOfLines,
                   rows: rows,
                   selectionStyle: selectionStyle,
                   cellType: cellType,
                   type: .floatingMenu)
    }
}

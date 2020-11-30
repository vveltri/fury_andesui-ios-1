//
//  DropdownFloatingMenuType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc internal class DropdownFloatingMenu: AndesDropdownMenu {
    @objc init(numberOfLines: Int = 0,
                         rows: [AndesDropDownMenuCell],
                         selectionStyle: AndesSelectionStyle,
                         cellType: AndesDropdownCellType) {

        super.init(numberOfLines: numberOfLines,
                   rows: rows,
                   selectionStyle: selectionStyle,
                   cellType: cellType,
                   type: .floatingMenu)
    }
}

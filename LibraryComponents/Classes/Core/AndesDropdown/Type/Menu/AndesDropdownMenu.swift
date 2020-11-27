//
//  AndesDropdownMenuType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

@objc public class AndesDropdownMenu: NSObject {
    private(set) var numberOfLines: Int
    private(set) var rows: [AndesDropDownMenuCellType]
    private(set) var selectionStyle: AndesSelectionStyle
    private(set) var cellType: AndesDropdownCellType
    private(set) var type: AndesDropdownMenuType

    public init(numberOfLines: Int = 0,
                rows: [AndesDropDownMenuCellType],
                selectionStyle: AndesSelectionStyle = .defaultStyle,
                cellType: AndesDropdownCellType = .none,
                type: AndesDropdownMenuType = .botttomSheet) {
        self.numberOfLines = numberOfLines
        self.rows = rows
        self.selectionStyle = selectionStyle
        self.cellType = cellType
        self.type = type
    }
}

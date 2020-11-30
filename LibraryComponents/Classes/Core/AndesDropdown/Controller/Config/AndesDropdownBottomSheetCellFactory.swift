//
//  AndesDropdownBottomSheetConfig.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/11/20.
//

import Foundation

class AndesDropdownBottomSheetCellFactory {

    static func provide(menuCellType: [AndesDropDownMenuCell], size: AndesListSize, numberOfLines: Int) -> [AndesSimpleCell] {
        var cell: [AndesSimpleCell] = []
        menuCellType.forEach({ (cellType) in
            cell.append(AndesSimpleCell(withTitle: cellType.title,
                                        subtitle: nil,
                                        thumbnail: cellType.thumbnail,
                                        numberOfLines: numberOfLines))
        })

        return cell
    }
}

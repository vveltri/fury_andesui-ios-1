//
//  DropdownViewController.swift
//  AndesUI-demoapp
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

class DropdownViewController: UIViewController {

    @IBOutlet var andesDropdown: AndesDropdown!

    var cell: [AndesDropDownMenuCellType] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let icon = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size24, state: .enabled, image: UIImage(named: "logo_global") ?? UIImage(), accentColor: UIColor.clear)

        cell =
            [AndesDropDownMenuCellType(title: "Dinero en cuenta", thumbnail: icon),
             AndesDropDownMenuCellType(title: "Visa debito **** 0899", thumbnail: icon),
             AndesDropDownMenuCellType(title: "BBVA **** 7788", thumbnail: icon),
             AndesDropDownMenuCellType(title: "BBVA **** 4545", thumbnail: icon),
             AndesDropDownMenuCellType(title: "Mercado Créditos", thumbnail: icon)]

        andesDropdown.delegate = self
        andesDropdown.triggerType = FormDropdownCell(title: "Title", placeholder: "Placeholder")
//        andesDropdown.triggerType = StandaloneDropdownCell(title: "Title")

        andesDropdown.menuType = DropdownBottomSheetType(title: "Seleccione",
                                                         separatorStyle: .singleLine,
                                                         titleAligment: .right,
                                                         numberOfLines: 1,
                                                         rows: cell,
                                                         selectionStyle: .defaultStyle,
                                                         cellType: .none)

//        andesDropdown.menuType = DropdownFloatingMenuType(numberOfLines: 1,
//                                                          rows: cell,
//                                                          selectionStyle: .none,
//                                                          cellType: .none)
    }
}

extension DropdownViewController: AndesDropDownDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        print(indexPath.row)
    }
}

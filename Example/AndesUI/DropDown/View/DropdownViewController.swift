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

    var cell: [AndesDropDownMenuCellType]? = []

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
        andesDropdown.menuCellType = cell
        andesDropdown.triggerType = .formDropdown
        andesDropdown.menuType = .bottomSheet
        andesDropdown.aligmentTitleBottomSheet = NSTextAlignment.center
        andesDropdown.title = "Medio de pago"
        andesDropdown.placeholder = "Placeholder"
        andesDropdown.titleBottomSheet = "Seleccione"
        andesDropdown.cellSize = .medium
        andesDropdown.numberOfLines = 1
        andesDropdown.separatorStyle = .none
        andesDropdown.selectionStyle = .defaultStyle

    }
}

extension DropdownViewController: AndesDropDownDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        print(indexPath.row)
    }
}

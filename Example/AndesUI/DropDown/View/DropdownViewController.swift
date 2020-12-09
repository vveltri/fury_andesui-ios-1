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

    var cell: [AndesDropDownMenuCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let icon = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size24, state: .enabled, image: UIImage(named: "logo_global") ?? UIImage(), accentColor: UIColor.clear)

        cell =
            [AndesDropDownMenuCell(title: "Dinero en cuenta", thumbnail: icon),
             AndesDropDownMenuCell(title: "Visa debito **** 0899", thumbnail: icon),
             AndesDropDownMenuCell(title: "BBVA **** 7788", thumbnail: icon),
             AndesDropDownMenuCell(title: "BBVA **** 4545", thumbnail: icon),
             AndesDropDownMenuCell(title: "Mercado Créditos", thumbnail: icon)]

        andesDropdown.delegate = self
        andesDropdown.triggerType = FormDropdownTrigger(title: "Title", placeholder: "Placeholder")
//        andesDropdown.triggerType = StandaloneDropdownTrigger(size: .small)

        andesDropdown.menuType = DropdownBottomSheetMenu(separatorStyle: .none,
                                                         numberOfLines: 1,
                                                         rows: cell,
                                                         selectionStyle: .defaultStyle)

//        andesDropdown.menuType = DropdownFloatingMenu(numberOfLines: 1,
//                                                      rows: cell,
//                                                      selectionStyle: .none)
    }
}

extension DropdownViewController: AndesDropdownDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        print(indexPath.row)
    }
}

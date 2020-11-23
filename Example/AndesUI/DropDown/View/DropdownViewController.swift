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
    @IBOutlet var radioButtonForm: AndesRadioButton!
    @IBOutlet var radioButtonStandAlone: AndesRadioButton!

    var triggerType: AndesDropdownTriggerType = .formDropdown

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

        radioButtonForm.setRadioButtonTapped(callback: didTapIdle(radiobutton:))
        radioButtonStandAlone.setRadioButtonTapped(callback: didTapIdle(radiobutton:))

    }

    func didTapIdle(radiobutton: AndesRadioButton) {
        if radiobutton == radioButtonForm {
            radioButtonForm.status = .selected
            radioButtonStandAlone.status = .unselected
            andesDropdown.triggerType = .formDropdown
        } else if radiobutton == radioButtonStandAlone {
            radioButtonForm.status = .unselected
            radioButtonStandAlone.status = .selected
            andesDropdown.triggerType = .standalone
        }
    }
}

extension DropdownViewController: AndesDropDownDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        print(indexPath.row)
    }
}

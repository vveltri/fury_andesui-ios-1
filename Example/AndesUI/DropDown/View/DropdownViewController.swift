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

        let mastercard = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size80, state: .enabled, image: UIImage(named: "mastercard") ?? UIImage(), accentColor: UIColor.systemBlue)
        let visa = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size80, state: .enabled, image: UIImage(named: "visa") ?? UIImage(), accentColor: UIColor.clear)
        let american = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size80, state: .enabled, image: UIImage(named: "american") ?? UIImage(), accentColor: UIColor.clear)
        let mercadocredito = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size80, state: .enabled, image: UIImage(named: "mercadocredito") ?? UIImage(), accentColor: UIColor.clear)

        cell =
            [AndesDropDownMenuCellType(title: "Dinero en cuenta", thumbnail: mastercard),
             AndesDropDownMenuCellType(title: "Visa debito **** 0899", thumbnail: visa),
             AndesDropDownMenuCellType(title: "BBVA **** 7788", thumbnail: american),
             AndesDropDownMenuCellType(title: "BBVA **** 4545", thumbnail: american),
             AndesDropDownMenuCellType(title: "Mercado Créditos", thumbnail: mercadocredito)]

        andesDropdown.delegate = self
        andesDropdown.menuCellType = cell
        andesDropdown.triggerType = .formDropdown
        andesDropdown.menuType = .bottomSheet
        andesDropdown.aligmentTitleBottomSheet = NSTextAlignment.center
        andesDropdown.title = "Medio de pago"
        andesDropdown.placeholder = "Placeholder"
        andesDropdown.titleBottomSheet = "Seleccione"
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

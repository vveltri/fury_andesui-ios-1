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

    var cell: [AndesDropDownMenuCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let mastercard = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size80, state: .enabled, image: UIImage(named: "mastercard") ?? UIImage(), accentColor: UIColor.systemBlue)
        let visa = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size80, state: .enabled, image: UIImage(named: "visa") ?? UIImage(), accentColor: UIColor.clear)
        let american = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size80, state: .enabled, image: UIImage(named: "american") ?? UIImage(), accentColor: UIColor.clear)
        let mercadocredito = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size80, state: .enabled, image: UIImage(named: "mercadocredito") ?? UIImage(), accentColor: UIColor.clear)

        cell =
            [AndesDropDownMenuCell(title: "Dinero en cuenta", thumbnail: mastercard),
             AndesDropDownMenuCell(title: "Visa debito **** 0899", thumbnail: visa),
             AndesDropDownMenuCell(title: "BBVA **** 7788", thumbnail: american),
             AndesDropDownMenuCell(title: "BBVA **** 4545", thumbnail: american),
             AndesDropDownMenuCell(title: "Mercado Créditos", thumbnail: mercadocredito)]

        andesDropdown.delegate = self
        andesDropdown.triggerType = FormDropdownTrigger(title: "Title", placeholder: "Placeholder")
        andesDropdown.menuType = DropdownBottomSheetMenu(title: "Seleccione",
                                                         separatorStyle: .none,
                                                         titleAligment: .right,
                                                         numberOfLines: 1,
                                                         rows: cell,
                                                         selectionStyle: .defaultStyle,
                                                         cellType: .none)

//        andesDropdown.menuType = DropdownFloatingMenu(numberOfLines: 1,
//                                                      rows: cell,
//                                                      selectionStyle: .none,
//                                                      cellType: .none)

        radioButtonForm.setRadioButtonTapped(callback: didTapIdle(radiobutton:))
        radioButtonStandAlone.setRadioButtonTapped(callback: didTapIdle(radiobutton:))

    }

    func didTapIdle(radiobutton: AndesRadioButton) {
        if radiobutton == radioButtonForm {
            radioButtonForm.status = .selected
            radioButtonStandAlone.status = .unselected
            andesDropdown.triggerType = FormDropdownTrigger(title: "Title", placeholder: "Placeholder")
        } else if radiobutton == radioButtonStandAlone {
            radioButtonForm.status = .unselected
            radioButtonStandAlone.status = .selected
            andesDropdown.triggerType = StandaloneDropdownTrigger(title: "Title")
        }
    }
}

extension DropdownViewController: AndesDropdownDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        print(indexPath.row)
    }
}

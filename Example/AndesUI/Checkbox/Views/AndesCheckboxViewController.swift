//
//  AndesCheckboxShowcaseViewController.swift
//  AndesUI-demoapp
//
//  Created by Rodrigo Pintos Costa on 6/12/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

class AndesCheckboxViewController: UIViewController {
    @IBOutlet var checkbox: UIView!
    @IBOutlet var checkboxView: AndesCheckbox!

    override func viewDidLoad() {
        self.title = "AndesCheckbox"

        checkboxView = AndesCheckbox(type: AndesCheckboxType.idle, align: AndesCheckboxAlign.left, status: AndesCheckboxStatus.selected, title: "Prueba")

    }

}

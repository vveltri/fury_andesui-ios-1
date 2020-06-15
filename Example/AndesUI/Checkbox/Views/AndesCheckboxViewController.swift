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
    @IBOutlet var cb1: CheckBox!
    @IBOutlet weak var cb2: CheckBox!
    @IBOutlet var cb3: CheckBox!
    @IBOutlet var cb4: CheckBox!

    override func viewDidLoad() {
        self.title = "AndesCheckbox"
        cb1.style = .square
        cb2.style = .cross
        cb3.style = .circle
        cb4.style = .tick

        cb1.borderStyle = .rounded
        cb2.borderStyle = .square
        cb3.borderStyle = .roundedSquare(radius: 8)
        cb4.borderStyle = .roundedSquare(radius: 12)

    }

    @objc func onCheckBoxValueChange(_ sender: CheckBox) {

        print(sender.isChecked)
    }
}

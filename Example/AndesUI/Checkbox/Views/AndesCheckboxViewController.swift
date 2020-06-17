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

    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        self.title = "AndesCheckbox"
        self.checkbox.addSubview(stackView)

        self.stackView.axis = .vertical
        self.stackView.alignment = .fill
        self.stackView.distribution = .fill

        // Idle - Unselected
        let idleCheckboxView: AndesCheckbox! = AndesCheckbox(type: AndesCheckboxType.idle, align: AndesCheckboxAlign.left, status: AndesCheckboxStatus.unselected, title: "Idle - Unselected")
        idleCheckboxView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        // Idle - Undefined
        let idleUndefinedCheckboxView: AndesCheckbox! = AndesCheckbox(type: AndesCheckboxType.idle, align: AndesCheckboxAlign.left, status: AndesCheckboxStatus.undefined, title: "Idle - Undefined")
            idleUndefinedCheckboxView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        // Disabled - Selected
        let disabledCheckboxView: AndesCheckbox! = AndesCheckbox(type: AndesCheckboxType.disabled, align: AndesCheckboxAlign.left, status: AndesCheckboxStatus.selected, title: "Disabled - Selected")
        disabledCheckboxView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        // Disabled - Unselected
        let disabledUnselectedCheckboxView: AndesCheckbox! = AndesCheckbox(type: AndesCheckboxType.disabled, align: AndesCheckboxAlign.left, status: AndesCheckboxStatus.unselected, title: "Disabled - Unselected")
        disabledUnselectedCheckboxView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        // Disabled - Unselected
        let disabledUndefinedCheckboxView: AndesCheckbox! = AndesCheckbox(type: AndesCheckboxType.disabled, align: AndesCheckboxAlign.left, status: AndesCheckboxStatus.undefined, title: "Disabled - Undefined")
        disabledUndefinedCheckboxView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        // Error - Unselected
        let errorUndefinedCheckboxView: AndesCheckbox! = AndesCheckbox(type: AndesCheckboxType.error, align: AndesCheckboxAlign.left, status: AndesCheckboxStatus.unselected, title: "Error - Unselected")
        errorUndefinedCheckboxView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        stackView.addArrangedSubview(idleCheckboxView)
        stackView.addArrangedSubview(idleUndefinedCheckboxView)

        stackView.addArrangedSubview(disabledUnselectedCheckboxView)
        stackView.addArrangedSubview(disabledCheckboxView)
        stackView.addArrangedSubview(disabledUndefinedCheckboxView)

        stackView.addArrangedSubview(errorUndefinedCheckboxView)
    }

}

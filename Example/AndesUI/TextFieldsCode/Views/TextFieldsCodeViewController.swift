//
//  TextFieldsCodeViewController.swift
//  AndesUI-demoapp
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation
import AndesUI

final class TextFieldsCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let andesTextfieldCode = AndesTextfieldCode(label: "Label", helpLabel: "HelpLabel", style: "three_by_three")
        view.addSubview(andesTextfieldCode)
        NSLayoutConstraint.activate([
            andesTextfieldCode.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            andesTextfieldCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            andesTextfieldCode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
}

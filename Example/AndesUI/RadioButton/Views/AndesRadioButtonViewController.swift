//
//  AndesRadioButtonViewController.swift
//  AndesUI-demoapp
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

protocol RadioButtonView: NSObject {

}

class AndesRadioButtonViewController: UIViewController, RadioButtonView {

    @IBOutlet weak var radioButton: AndesRadioButton!

    override func viewDidLoad() {

        radioButton.setRadioButtonTapped(callback: didTapIdle(radiobutton:))

        // Idle - Unselected - left
        /*let idleRadioButtonView: AndesRadioButton! = AndesRadioButton(type: AndesRadioButtonType.idle, align: AndesRadioButtonAlign.left, status: AndesRadioButtonStatus.unselected, title: "Idle - Unselected - left")
        
        stackView.addArrangedSubview(idleRadioButtonView)*/

    }

    func didTapIdle(radiobutton: AndesRadioButton) {
        var alert: UIAlertController = UIAlertController()
        switch radiobutton.type {
        case .idle:
            if radiobutton.status == .unselected {
                alert = UIAlertController(title: "AndesUI Radiobutton", message: "RadioButton idle unselected pressed", preferredStyle: .alert)
            } else {
                alert = UIAlertController(title: "AndesUI Radiobutton", message: "RadioButton idle selected pressed", preferredStyle: .alert)
            }
        case .disabled:
            return
        case .error:
            alert = UIAlertController(title: "AndesUI RadioButton", message: "RadioButton error pressed", preferredStyle: .alert)
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

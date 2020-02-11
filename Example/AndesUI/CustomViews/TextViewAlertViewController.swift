//
//  TextViewAlertViewController.swift
//  AndesUI-demoapp
//
//  Created by Nicolas Rostan Talasimov on 2/10/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit

class TextViewAlertViewController: UIAlertController {

    var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.autoresizesSubviews = true

        textView = UITextView(frame: .zero)
        self.view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -64).isActive = true
        textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true

    }
}

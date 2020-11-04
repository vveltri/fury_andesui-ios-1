//
//  BottomSheetExampleContentViewController.swift
//  AndesUI-demoapp
//
//  Created by Tomi De Lucca on 29/10/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import AndesUI

class BottomSheetExampleContentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Tomi"

        view.backgroundColor = .white

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, world!"
        label.textColor = UIColor.Andes.gray800
        label.font = AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyL)

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            label.rightAnchor.constraint(equalTo: view.rightAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: 300)
        ])
    }
}

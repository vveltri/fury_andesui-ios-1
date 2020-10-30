//
//  BottomSheetSwiftExampleViewController.swift
//  AndesUI-demoapp
//
//  Created by Tomi De Lucca on 29/10/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import AndesUI

class BottomSheetSwiftExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bottom Sheet"
        view.backgroundColor = .white

        let button = AndesButton(text: "Open Sheet", hierarchy: .loud, size: .large)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openSheet), for: .touchUpInside)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }

    @objc
    private func openSheet() {
        let sheet = AndesBottomSheetViewController(rootViewController: BottomSheetExampleContentViewController())
        present(sheet, animated: true)
    }
}

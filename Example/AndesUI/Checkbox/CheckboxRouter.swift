//
//  CheckboxRouter.swift
//  AndesUI-demoapp
//
//  Created by Rodrigo Pintos Costa on 6/12/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit

protocol CheckboxRouter: NSObject {
    func route(from: UIViewController)
}

class CheckboxAppRouter: NSObject {
    var view: AndesCheckboxViewController!
}

extension CheckboxAppRouter: CheckboxRouter {
    func route(from: UIViewController) {
        view = AndesCheckboxViewController()
        view.title = "AndesCheckbox"
        from.navigationController?.pushViewController(view, animated: true)
    }
}

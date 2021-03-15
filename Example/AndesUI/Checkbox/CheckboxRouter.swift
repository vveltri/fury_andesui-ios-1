//
//  CheckboxRouter.swift
//  AndesUI-demoapp
//
//  Created by Rodrigo Pintos Costa on 6/12/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation

class CheckboxRouter: HomeRouterProtocol {
    func route(from: UIViewController) {
        from.navigationController?.pushViewController(AndesCheckboxShowcaseViewController(), animated: true)
    }
}

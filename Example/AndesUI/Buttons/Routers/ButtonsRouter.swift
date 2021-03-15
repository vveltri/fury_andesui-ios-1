//
//  ButtonsRouter.swift
//  AndesUI_Example
//
//  Created by Santiago Lazzari on 19/12/2019.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

import Foundation

class ButtonsRouter: HomeRouterProtocol {
    func route(from: UIViewController) {
        from.navigationController?.pushViewController(ButtonsViewController(), animated: true)
    }
}

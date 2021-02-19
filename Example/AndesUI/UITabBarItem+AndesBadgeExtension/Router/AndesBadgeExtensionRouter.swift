//
//  AndesBadgeExtensionRoutern.swift
//  AndesUI-demoapp
//
//  Created by Julián Lima on 03/02/2021.
//  Copyright © 2021 MercadoLibre. All rights reserved.
//

class AndesBadgeExtensionAppRouter: HomeRouterProtocol {
    var view: UIViewController
    init() {
        view = AndesBadgeExtensionTabBarController()
    }
    func route(from: UIViewController) {
        from.navigationController?.pushViewController(view, animated: true)
    }
}

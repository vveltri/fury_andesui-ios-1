//
//  ListRouter.swift
//  AndesUI-demoapp
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation

class ListRouter: HomeRouterProtocol {
    func route(from: UIViewController) {
        //TODO fijarme en cambiar el var por el let!
        let viewController = AndesShowcasePageViewController(controllers: [ListViewController(),
                                                                           ListObjcViewController()])
        viewController.title = "AndesList"
        from.navigationController?.pushViewController(viewController, animated: true)
    }
}

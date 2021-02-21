//
//  HomePresenter.swift
//  AndesUI_Example
//
//  Created by Santiago Lazzari on 19/12/2019.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

import UIKit

class HomePresenter {
    let router = HomeAppRouter()
    unowned var viewController: UIViewController?
//    init(viewController: UIViewController) {
//        self.viewController = viewController
//    }
    
    
    
    func present(view: RouterVC) { //TODO cambiar para que no conozca el router la vista
        if let vc = self.viewController {
            self.router.doRoute(fromVC: vc, newRouter: view)
        }
    }
}


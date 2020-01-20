//
//  HomeRouter.swift
//  AndesUI_Example
//
//  Created by Santiago Lazzari on 19/12/2019.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

import UIKit

protocol HomeRouter: NSObject {
    func route(from: UIViewController)
    func routeToButton()
}

class HomeAppRouter: NSObject {
    let view = HomeViewController()
    var presenter: HomePresenter?

    let buttonsRouter = ButtonsAppRouter()

}

extension HomeAppRouter: HomeRouter {
    func route(from: UIViewController) {
        presenter = HomeViewPresenter(view: view, router: self)
        view.presenter = presenter

        let navigation = UINavigationController(rootViewController: view)
        navigation.modalPresentationStyle = .fullScreen

        from.present(navigation, animated: false, completion: nil)
    }

    func routeToButton() {
        buttonsRouter.route(from: view)
    }
}

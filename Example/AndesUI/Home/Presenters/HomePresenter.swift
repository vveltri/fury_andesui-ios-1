//
//  HomePresenter.swift
//  AndesUI_Example
//
//  Created by Santiago Lazzari on 19/12/2019.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

import UIKit

protocol HomePresenter: NSObject {
    func presentButtons()
    func presentMessages()
    func presentWhatsNew()
}

class HomeViewPresenter: NSObject {

    unowned let view: HomeView
    unowned let router: HomeRouter

    init(view: HomeView, router: HomeRouter) {
        self.view = view
        self.router = router
    }
}

extension HomeViewPresenter: HomePresenter {
    func presentButtons() {
        router.routeToButton()
    }

    func presentMessages() {
        router.routeToMessages()
    }
    func presentWhatsNew() {
        router.routeToWhatsNew()
    }
}

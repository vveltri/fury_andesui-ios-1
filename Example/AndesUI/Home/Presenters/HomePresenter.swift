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
    func presentTextField()
    func presentBadges()
    func presentWhatsNew()
    func presentCheckbox()
    func presentTags()
    func presentSnackbar()
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

    func presentBadges() {
        router.routeToBadges()
    }

    func presentWhatsNew() {
        router.routeToWhatsNew()
    }

    func presentTextField() {
        router.routeTextField()
    }
    func presentCheckbox() {
        router.routerCheckbox()
    }

    func presentTags() {
        router.routeTags()
    }

    func presentSnackbar() {
        router.routeSnackbar()
    }
}

//
//  ListViewRouter.swift
//  AndesUI-demoapp
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit

protocol ListViewRouter: NSObject {
    func route(from: UIViewController)
}

class ListViewAppRouter: NSObject {
    var view: AndesShowcasePageViewController!
}

extension ListViewAppRouter: ListViewRouter {
    func route(from: UIViewController) {
        view = AndesShowcasePageViewController(controllers: [ListViewViewController()])
        view.title = "AndesListView"
        from.navigationController?.pushViewController(view, animated: true)
    }
}

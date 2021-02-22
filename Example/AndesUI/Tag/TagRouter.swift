//
//  TagRouter.swift
//  AndesUI-demoapp
//
//  Created by Samuel Sainz on 5/29/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation

class TagsRouter: HomeRouterProtocol {
    func route(from: UIViewController) {
        from.navigationController?.pushViewController(AndesTagShowcaseViewController(), animated: true)
    }
}

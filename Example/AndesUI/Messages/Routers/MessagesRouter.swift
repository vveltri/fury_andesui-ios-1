//
//  MessagesRouter.swift
//  AndesUI_Example
//
//  Created by Nicolas Rostan Talasimov on 1/16/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit

protocol MessagesRouter: NSObject {
    func route(from: UIViewController)
}

class MessagesAppRouter: NSObject {
    var view: AndesMessageShowcaseViewController!
}

extension MessagesAppRouter: MessagesRouter {
    func route(from: UIViewController) {
        view = AndesMessageShowcaseViewController()
        from.navigationController?.pushViewController(view, animated: true)
    }
}

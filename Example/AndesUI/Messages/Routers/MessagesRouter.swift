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
//    Messages view controller in swift code, uncomment to use this code in testapp
    var view: MessageViewController!

//    Messages view controller in objc code, uncomment to use this code in testapp
//    var view: MessageObjCViewController!
}

extension MessagesAppRouter: MessagesRouter {
    func route(from: UIViewController) {
        view = MessageViewController()
//        view = MessageObjCViewController()
        from.navigationController?.pushViewController(view, animated: true)
    }
}

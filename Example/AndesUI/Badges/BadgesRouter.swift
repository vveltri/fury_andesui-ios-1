//
//  BadgesRouter.swift
//  AndesUI-demoapp
//

import Foundation

class BadgesRouter: HomeRouterProtocol {
    func route(from: UIViewController) {
        from.navigationController?.pushViewController(AndesBadgeShowcaseViewController(), animated: true)
    }
}

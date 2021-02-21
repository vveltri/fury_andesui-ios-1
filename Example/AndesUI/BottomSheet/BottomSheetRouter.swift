//
//  BottomSheetRouter.swift
//  AndesUI-demoapp
//
//  Created by Tomi De Lucca on 29/10/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit

class BottomSheetRouter: HomeRouterProtocol {
    func route(from: UIViewController) {
        var viewVC = AndesShowcasePageViewController(controllers: [BottomSheetSwiftExampleViewController(), BottomSheetObjectiveCExampleViewController()])
        viewVC.title = "Bottom Sheet"
        from.navigationController?.pushViewController(viewVC, animated: true)
    }
}

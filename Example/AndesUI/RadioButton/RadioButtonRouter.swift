//
//  RadioButtonRouter.swift
//  AndesUI-demoapp
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation

class RadioButtonRouter: HomeRouterProtocol {
    func route(from: UIViewController) {
        //TODO fijarme en cambiar el var por el let!
        let viewController = AndesShowcasePageViewController(controllers: [AndesRadioButtonViewController(), RadioButtonObjCViewController()])
        viewController.title = "Andes RadioButton"
        from.navigationController?.pushViewController(viewController, animated: true)
    }
}

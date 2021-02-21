//
//  DatePickerRouter.swift
//  AndesUI-demoapp
//
//  Created by Ândriu Felipe Coelho on 14/11/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation

//TODO sacar el import de  UIKIt de los routers


class DatePickerRouter: HomeRouterProtocol {
    func route(from: UIViewController) {
        from.navigationController?.pushViewController(DatePickerViewController(), animated: true)
    }
}

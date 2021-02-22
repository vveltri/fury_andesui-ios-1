//
//  DatePickerRouter.swift
//  AndesUI-demoapp
//
//  Created by Ândriu Felipe Coelho on 14/11/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation

class DatePickerRouter: HomeRouterProtocol {
    func route(from: UIViewController) {
        from.navigationController?.pushViewController(DatePickerViewController(), animated: true)
    }
}

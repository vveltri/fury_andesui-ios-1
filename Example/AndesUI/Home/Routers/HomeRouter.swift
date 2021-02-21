//
//  HomeRouter.swift
//  AndesUI_Example
//
//  Created by Santiago Lazzari on 19/12/2019.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

import UIKit


protocol HomeRouterProtocol {
    func route(from: UIViewController)
}


enum RouterVC {
    case progressIndicatorRouter
    case coachmarkRouter
    case buttonsRouter
    case messagesRouter
    case badgesRouter
    case whatsNewRouter
    case textFieldRouter
    case checkBoxRouter
    case radioButtonRouter
    case tagRouter
    case snackbarRouter
    case cardRouter
    case thumbnailRouter
    case textFieldsCodeRouter
    case datePickerRouter
    case bottomSheetRouter
    case listRouter
    case dropdownRouter
    case andesBadgeExtensionRouter
}


protocol HomeRouter:class {
    func start(in window: UIWindow)
    func doRoute (fromVC: UIViewController,newRouter:RouterVC)
}
    

class HomeAppRouter: HomeRouter {
    func doRoute (fromVC: UIViewController,newRouter:RouterVC)  {
        var h : HomeRouterProtocol
        
        switch newRouter {
        case .progressIndicatorRouter:
            h = AndesBadgeExtensionRouter()
        case .coachmarkRouter:
            h = CoachmarkRouter()
        case .buttonsRouter:
            h = ButtonsRouter()
        case .messagesRouter:
            h = MessagesRouter()
        case .badgesRouter:
            h = BadgesRouter()
        case .whatsNewRouter:
            h = WhatsNewRouter()
        case .textFieldRouter:
            h = TextFieldsRouter()
        case .checkBoxRouter:
            h = CheckboxRouter()
        case .radioButtonRouter:
            h = RadioButtonRouter()
        case .tagRouter:
            h = TagsRouter()
        case .snackbarRouter:
            h = SnackbarRouter()
        case .cardRouter:
            h = CardRouter()
        case .thumbnailRouter:
            h = ThumbnailRouter()
        case .textFieldsCodeRouter:
            h = TextFieldsCodeRouter()
        case .datePickerRouter:
            h = DatePickerRouter()
        case .bottomSheetRouter:
            h = BottomSheetRouter()
        case .listRouter:
            h = ListRouter()
        case .dropdownRouter:
            h = DropdownRouter()
        case .andesBadgeExtensionRouter:
            h = AndesBadgeExtensionRouter()
        }
        h.route(from: fromVC)
    }
    
    func start(in window: UIWindow) {
        let vc = HomeViewController()
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
    }

}


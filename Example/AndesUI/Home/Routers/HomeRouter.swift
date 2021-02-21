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

enum TestappViews {
    case progressIndicator
    case coachmark
    case buttons
    case messages
    case badges
    case whatsNew
    case textField
    case checkBox
    case radioButton
    case tag
    case snackbar
    case card
    case thumbnail
    case textFieldsCode
    case datePicker
    case bottomSheet
    case list
    case dropdown
    case andesBadgeExtensions
}

protocol HomeRouter:class {
    func start(in window: UIWindow)
    func doRoute (fromVC: UIViewController,newRouter:TestappViews)
}
    
class HomeAppRouter: HomeRouter {
    func doRoute (fromVC: UIViewController,newRouter:TestappViews)  {
        var h : HomeRouterProtocol
        
        switch newRouter {
        case .progressIndicator:
            h = AndesBadgeExtensionRouter()
        case .coachmark:
            h = CoachmarkRouter()
        case .buttons:
            h = ButtonsRouter()
        case .messages:
            h = MessagesRouter()
        case .badges:
            h = BadgesRouter()
        case .whatsNew:
            h = WhatsNewRouter()
        case .textField:
            h = TextFieldsRouter()
        case .checkBox:
            h = CheckboxRouter()
        case .radioButton:
            h = RadioButtonRouter()
        case .tag:
            h = TagsRouter()
        case .snackbar:
            h = SnackbarRouter()
        case .card:
            h = CardRouter()
        case .thumbnail:
            h = ThumbnailRouter()
        case .textFieldsCode:
            h = TextFieldsCodeRouter()
        case .datePicker:
            h = DatePickerRouter()
        case .bottomSheet:
            h = BottomSheetRouter()
        case .list:
            h = ListRouter()
        case .dropdown:
            h = DropdownRouter()
        case .andesBadgeExtensions:
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


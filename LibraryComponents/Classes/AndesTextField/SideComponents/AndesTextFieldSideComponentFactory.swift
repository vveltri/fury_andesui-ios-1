//
//  AndesTextFieldSideComponentFactory.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
//

import Foundation
internal class AndesTextFieldComponentFactory {
    static func generateLeftComponentView(for component: AndesTextFieldLeftComponent, in view: AndesTextFieldView) -> UIView? {
        if let component = (component as? AndesTextFieldComponentLabel) {
            return AndesTextFieldLabelView(text: component.text, style: component.style)
        } else if let component = component as? AndesTextFieldComponentIcon {
            return AndesTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        }
        return nil
    }

    static func generateRightComponentView(for component: AndesTextFieldRightComponent, in view: AndesTextFieldView) -> UIView? {
        if let component = component as? AndesTextFieldComponentLabel {
            return AndesTextFieldLabelView(text: component.text, style: component.style)
        } else if let component = component as? AndesTextFieldComponentIcon {
            return AndesTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        } else if let component = component as? AndesTextFieldComponentCheck {
            return AndesTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        } else if let component = component as? AndesTextFieldComponentClear {
            return AndesTextFieldClearView(iconColor: component.iconColor, iconName: component.clearIcon) { [weak view] in
               view?.clear()
           }
        } else if let component = component as? AndesTextFieldComponentAction {
            return AndesTextFieldActionView(label: component.label) {[weak view] in
                view?.delegate?.didTapRightAction()
            }
        }
        return nil
    }
}

//
//  AndesMessageViewConfigFactory.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/22/20.
//

import Foundation
internal class AndesMessageViewConfigFactory {
    static func provideConfig(hierarchy: AndesMessageHierarchy, type: AndesMessageType, title: String?, body: String, isDismissable: Bool, primaryActionText: String?, secondaryActionText: String?) -> AndesMessageViewConfig {
        let typeIns = AndesMessageTypeFactory.provide(type)
        let hierarchyIns = AndesMessageHierarchyFactory.provide(hierarchy, forType: typeIns)

        var config = AndesMessageViewConfig(backgroundColor: hierarchyIns.backgroundColor, pipeColor: hierarchyIns.pipeColor, textColor: hierarchyIns.textColor, titleText: title, bodyText: body, icon: typeIns.icon, iconBackgroundColor: hierarchyIns.accentColor, isDismissable: isDismissable, dismissIconColor: hierarchyIns.textColor)

        if let primaryText = primaryActionText {
            config.primaryActionConfig = AndesButtonViewConfigFactory.provide(hierarchy: hierarchyIns.primaryButtonHierarchy, size: AndesButtonSizeMedium(), text: primaryText, icon: nil)
        }

        if let secondaryText = secondaryActionText {
            config.secondaryActionConfig = AndesButtonViewConfigFactory.provide(hierarchy: hierarchyIns.secondaryButtonHierarchy, size: AndesButtonSizeMedium(), text: secondaryText, icon: nil)
        }

        return config
    }
}

//
//  AndesMessageViewConfigFactory.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/22/20.
//

import Foundation
internal class AndesMessageViewConfigFactory {
    static func provideConfig(hierarchy: AndesMessageHierarchy, type: AndesMessageType, title: String?, body: String, isDismissable: Bool) -> AndesMessageViewConfig {
        let typeIns = AndesMessageTypeFactory.provide(type)
        let hierarchyIns = AndesMessageHierarchyFactory.provide(hierarchy, forType: typeIns)
        return AndesMessageViewConfig(backgroundColor: hierarchyIns.backgroundColor, pipeColor: hierarchyIns.pipeColor, textColor: hierarchyIns.textColor, titleText: title, bodyText: body, icon: typeIns.icon, iconBackgroundColor: hierarchyIns.accentColor, isDismissable: isDismissable, dismissIconColor: hierarchyIns.textColor)
    }
}

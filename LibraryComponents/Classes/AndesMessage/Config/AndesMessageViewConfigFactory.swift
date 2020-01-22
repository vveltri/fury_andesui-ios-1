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
        return AndesMessageViewConfig(iconBackgroundColor: hierarchyIns.accentColor, backgroundColor: hierarchyIns.backgroundColor, pipeColor: hierarchyIns.pipeColor, titleText: title, textColor: hierarchyIns.textColor, bodyText: body, icon: typeIns.icon, isDismissable: isDismissable, dismissIconColor: hierarchyIns.textColor)
    }
}

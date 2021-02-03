//
//  AndesTabBarValueBuilder.swift
//  AndesUI
//
//  Created by Julián Lima on 24/01/2021.
//

final private class AndesTabBarValueBuilder {
    class func build(in item: UITabBarItem, for value: UInt) -> String? {
        if value == 0 {
            item.badgeValue = nil
            return nil
        } else {
            let stringNumber: String? = value > 99 ? "99+" : String(value)
            item.badgeValue = stringNumber
            return stringNumber
        }
    }
}

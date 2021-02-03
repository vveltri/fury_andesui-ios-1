//
//  AndesTabBarValueBuilder.swift
//  AndesUI
//
//  Created by Julián Lima on 24/01/2021.
//

final class AndesTabBarValueBuilder {
    class func build(in item: UITabBarItem, for value: Int) -> String? {
        guard value > 0 else {
            item.badgeValue = nil
            return nil
        }

        let stringNumber: String? = value > 99 ? "99+" : String(value)
        item.badgeValue = stringNumber
        return stringNumber
    }
}

//
//  AndesTabBarValueBuilder.swift
//  AndesUI
//
//  Created by Julián Lima on 24/01/2021.
//

final class AndesTabBarValueBuilder {
    class func build(in item: UITabBarItem, for value: String?) -> String? {
        var stringNumber: String?

        if let string = value, let integerValue = UInt(string) {
            stringNumber = integerValue > 99 ? "99+" : value
        }

        item.badgeValue = stringNumber
        return stringNumber
    }
}

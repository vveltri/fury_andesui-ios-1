//
//  AndesEnumStringConvertible.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/30/20.
//

import Foundation
public protocol AndesEnumStringConvertible: CaseIterable {
    static func keyFor(_ value: Self) -> String
    var rawValue: Int { get }
    static func fromString(_ str: String) -> Self?
    func toString() -> String
    static var allKeys: [String] { get }
}

public extension AndesEnumStringConvertible {
    static var allKeys: [String] {
        return Self.allCases.map({Self.keyFor($0)})
    }

    func toString() -> String {
        return Self.keyFor(self)
    }

    static func fromString(_ str: String) -> Self? {
        return self.allCases.first(where: { Self.keyFor($0).uppercased() == str.uppercased() })
    }
}

internal extension AndesEnumStringConvertible {
    static func checkValidEnum<T: AndesEnumStringConvertible>(property: String, key: String) -> T {
        guard let value = T.fromString(key) else {
            fatalError("The available values for \(property) are \(T.allKeys)")
        }
        return value
    }
}

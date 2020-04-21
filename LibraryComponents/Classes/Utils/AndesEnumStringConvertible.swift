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
    func toString() -> String
    static var allKeys: [String] { get }

    init?(from string: String)
}

public extension AndesEnumStringConvertible {
    static var allKeys: [String] {
        return Self.allCases.map({Self.keyFor($0)})
    }

    func toString() -> String {
        return Self.keyFor(self)
    }

    init?(from string: String) {
        guard let value = Self.allCases.first(where: { Self.keyFor($0).uppercased() == string.uppercased() }) else {
            return nil
        }
        self = value
    }
}

internal extension AndesEnumStringConvertible {
    static func checkValidEnum<T: AndesEnumStringConvertible>(property: String, key: String) -> T {
        guard let value = T.init(from: key) else {
            fatalError("The available values for \(property) are \(T.allKeys)")
        }
        return value
    }
}

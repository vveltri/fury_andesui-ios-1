//
//  AndesEnumStringConvertible.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/30/20.
//

import Foundation
protocol AndesEnumStringConvertible: LosslessStringConvertible, CaseIterable {
    static func keyFor(_ value: Self) -> String
    var rawValue: Int { get }
    static func fromString(_ str: String) -> Self?
    func toString() -> String
    static var allKeys: [String] { get }
    init?(rawValue: Int)
}

extension AndesEnumStringConvertible {
    public init?(_ description: String) {
        let uppercased = description.uppercased()
        guard let value = Self.allCases.first(where: { Self.keyFor($0) == uppercased }) else {
            return nil
        }
        self.init(rawValue: value.rawValue)
    }

    static var allKeys: [String] {
        return Self.allCases.map({Self.keyFor($0)})
    }

    func toString() -> String {
        return self.description
    }

    static func fromString(_ str: String) -> Self? {
        return Self.init(str)
    }

    public var description: String {
        return Self.keyFor(self)
    }
}

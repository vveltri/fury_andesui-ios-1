//
//  AndesEnumStringConvertible.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/30/20.
//

import Foundation
protocol AndesEnumStringConvertible: LosslessStringConvertible {
    static var keys: [String] { get }
    var rawValue: Int { get }
    init?(rawValue: Int)
}

extension AndesEnumStringConvertible {
    public init?(_ description: String) {
        guard let rawValue = Self.keys.firstIndex(of: description.uppercased()) else {
            return nil
        }
        self.init(rawValue: rawValue)
    }

    public var description: String {
        return Self.keys[self.rawValue]
    }
}

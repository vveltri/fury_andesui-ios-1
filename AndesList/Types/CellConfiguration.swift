//
//  CellConfiguration.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public struct ConfigurationCell {
    public var type: TypesCell
    public var title: String

    public init(type: TypesCell, title: String) {
        self.type = type
        self.title = title
    }
}

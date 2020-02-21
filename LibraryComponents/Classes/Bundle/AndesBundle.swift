//
//  AndesBundle.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 05/12/2019.
//

import Foundation

public class AndesBundle {
    public static func bundle() -> Bundle {
        let main = Bundle(for: self)
        let bundlePath = main.resourceURL?.appendingPathComponent("AndesUI.bundle")
        return Bundle(url: bundlePath!)!
    }
}

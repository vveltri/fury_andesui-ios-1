//
//  AndesTagSimpleView.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/27/20.
//

import Foundation

internal protocol AndesTagView: UIView {
    func update(withConfig config: AndesTagViewConfig)
}

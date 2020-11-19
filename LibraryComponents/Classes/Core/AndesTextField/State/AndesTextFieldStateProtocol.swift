//
//  AndesTextFieldStateProtocol.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation

internal protocol AndesTextFieldStateProtocol {
    var borderColor: UIColor { get set }
    var borderWidth: CGFloat { get set }
    var borderDashed: Bool { get set }

    var labelTextColor: UIColor { get }

    var helperColor: UIColor { get }
    var helperIconTintColor: UIColor? { get }
    var helperIconName: String? { get }
    var helperSemibold: Bool { get }

    var backgroundColor: UIColor { get set }
    var inputTextColor: UIColor { get set }
    var editingEnabled: Bool { get }

    var placeholderTextColor: UIColor { get }
}

//
//  UIView+Additions.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/24/20.
//

import Foundation

internal extension UIView {
    func pinToSuperview() {
        guard let superview = self.superview else {
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }

    func pinToSuperview(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        guard let superview = self.superview else {
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: left).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -right).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom).isActive = true
    }
}

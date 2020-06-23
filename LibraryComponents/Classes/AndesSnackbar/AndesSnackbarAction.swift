//
//  AndesSnackbarAction.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import Foundation

@objc public class AndesSnackbarAction: NSObject {

    /// Text shown in Snackbar Action
    let text: String

    /// Callback to be invoked when the action button is tapped and snackbar is dismissed
    let callback: (() -> Void)

    @objc public init(text: String, callback: @escaping (() -> Void)) {
        self.text = text
        self.callback = callback
        super.init()
    }
}

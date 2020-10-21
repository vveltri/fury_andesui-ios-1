//
//  AndesListViewDelegate.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//

import Foundation
/// Protocol of AndesListView behaviour
@objc public protocol AndesListViewDelegate {

    @objc optional func andesListView(didSelectRowAt indexPath: IndexPath)

}

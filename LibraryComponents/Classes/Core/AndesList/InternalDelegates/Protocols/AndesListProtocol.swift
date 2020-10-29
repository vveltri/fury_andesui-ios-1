//
//  AndesListProtocol.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import Foundation

@objc internal protocol AndesListProtocol {
    func getNumberOfRows() -> Int
    func numberOfSections() -> Int
    func cellForRowAt(indexPath: IndexPath) -> AndesListCell
    func getSeparatorStyle() -> AndesSeparatorStyle
    @objc optional func didSelectRowAt(indexPath: IndexPath)
}

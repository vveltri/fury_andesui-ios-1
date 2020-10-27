//
//  AndesListViewProtocol.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import Foundation

@objc internal protocol AndesListViewProtocol {
    func getNumberOfRows() -> Int
    func numberOfSections() -> Int
    func cellForRowAt(indexPath: IndexPath) -> AndesListViewCell
    func getSeparatorStyle() -> AndesSeparatorStyleListView
    @objc optional func didSelectRowAt(indexPath: IndexPath)
}

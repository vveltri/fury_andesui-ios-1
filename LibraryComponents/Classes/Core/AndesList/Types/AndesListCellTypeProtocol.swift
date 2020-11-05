//
//  AndesListCellTypeProtocol.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

protocol AndesListCellTypeProtocol {
    var font: AndesFontStyle { get }
    var fontDescription: AndesFontStyle { get }
    var chevronImage: String { get }
    var thumbnailLeft: UIImage? { get }
}

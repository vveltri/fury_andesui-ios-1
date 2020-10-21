//
//  AndesListViewDataSource.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 21/10/20.
//

import Foundation

@objc public protocol AndesListViewDataSource {

    @objc func tableView(_ tableView: AndesListView, cellForRowAt indexPath: IndexPath) -> AndesListViewCell

}

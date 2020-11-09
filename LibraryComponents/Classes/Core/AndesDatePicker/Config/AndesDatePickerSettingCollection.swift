//
//  AndesDatePickerSettingCollection.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 09/11/20.
//

import UIKit

class AndesDatePickerSettingCollection: NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AndesCalendarCollectionViewCell.identifier, for: indexPath)

        cell.backgroundColor = .yellow

        return cell
    }
}

extension AndesDatePickerSettingCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item in collection view")
    }
}

class AndesCalendarCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: AndesCalendarCollectionViewCell.self)

}

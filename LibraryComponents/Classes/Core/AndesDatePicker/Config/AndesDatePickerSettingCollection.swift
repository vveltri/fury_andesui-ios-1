//
//  AndesDatePickerSettingCollection.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 09/11/20.
//

import UIKit

@objc public class AndesDatePickerSettingCollection: NSObject, UICollectionViewDataSource {

    // MARK: - Attributes

    var days: [AndesDayDatePicker] = []
    private var calendar = Calendar(identifier: .iso8601)
    private var header: AndesDatePickerHeaderView?

    private var baseDate: Date

    private var numberOfWeeksInBaseDate: Int {
        let headerSection = 3
        let weeks = calendar.range(of: .weekOfMonth, in: .month, for: baseDate)?.count ?? 0
        return weeks + headerSection
    }

    // MARK: - Initializer

    init(baseDate: Date, daysToRender days: [AndesDayDatePicker]) {
        self.days = days
        self.baseDate = baseDate
    }

    // MARK: - UICollectionViewDataSource

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let day = days[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AndesDatePickerCell.identifier, for: indexPath) as! AndesDatePickerCell
        cell.day = day

        return cell
    }
}

extension AndesDatePickerSettingCollection: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(collectionView.frame.width / 7)
        let height = Int(collectionView.frame.height) / numberOfWeeksInBaseDate

        return CGSize(width: width, height: height)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80.0)
    }

    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AndesDatePickerHeaderView.identifier, for: indexPath) as? AndesDatePickerHeaderView

            return header ?? UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
}

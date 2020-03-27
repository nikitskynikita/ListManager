//
//  UICollectionView+ListView.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit


// MARK: - Реализация представления упорядоченного списка `ListView` для `UICollectionView`.
extension UICollectionView: ListView {

    public func dequeueHeader(with identifier: String, for indexPath: IndexPath) -> UICollectionReusableView? {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                withReuseIdentifier: identifier,
                                                for: indexPath)
    }
    
    public func dequeueCell(with identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }

    public func dequeueFooter(with identifier: String, for indexPath: IndexPath) -> UICollectionReusableView? {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                withReuseIdentifier: identifier,
                                                for: indexPath)
    }

}

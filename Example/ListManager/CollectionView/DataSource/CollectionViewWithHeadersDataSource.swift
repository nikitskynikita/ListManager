//
//  CollectionViewWithHeadersDataSource.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit
import ListManager


open class CollectionViewWithHeadersDataSource: CollectionViewDataSource, MutableListHeaderManager {

    public var registeredHeaderFactories: [String : ListViewHeaderFactory] = [:]

    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
            let header = resolveHeader(for: collectionView, at: indexPath) else {
                return UICollectionReusableView()
        }

        return header
    }

}

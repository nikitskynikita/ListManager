//
//  CollectionViewDataSource.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit
import ListManager

open class CollectionViewDataSource: NSObject, MutableListCellManager {

    public var dataProvider: ListDataProvider

    public var registeredCellFactories: [String : ListViewCellFactory] = [:]

    public init(dataProvider: ListDataProvider) {
        self.dataProvider = dataProvider
    }

}

// MARK: - UICollectionViewDataSource
extension CollectionViewDataSource: UICollectionViewDataSource {

    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataProvider.numberOfSections()
    }

    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.numberOfItems(in: section)
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return resolveCell(for: collectionView, at: indexPath, defaultCell: UICollectionViewCell())
    }

}

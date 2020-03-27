//
//  TableViewDataSource.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit
import ListManager

open class TableViewDataSource: NSObject, MutableListCellManager {

    public var dataProvider: ListDataProvider

    public var registeredCellFactories: [String : ListViewCellFactory] = [:]

    public init(dataProvider: ListDataProvider) {
        self.dataProvider = dataProvider
    }
    
}

// MARK: - UITableViewDataSource
extension TableViewDataSource: UITableViewDataSource {

    open func numberOfSections(in tableView: UITableView) -> Int {
        return dataProvider.numberOfSections()
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.numberOfItems(in: section)
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return resolveCell(for: tableView, at: indexPath, defaultCell: UITableViewCell())
    }

}

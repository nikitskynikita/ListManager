//
//  TableViewDelegate.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit
import ListManager


open class TableViewDelegate: NSObject, MutableListHeaderManager {

    public var dataProvider: ListDataProvider

    public var registeredHeaderFactories: [String : ListViewHeaderFactory] = [:]

    public init(dataProvider: ListDataProvider) {
        self.dataProvider = dataProvider
    }

}

// MARK: - UITableViewDelegate
extension TableViewDelegate: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let indexPath = IndexPath(item: 0, section: section)
        return resolveHeader(for: tableView, at: indexPath)
    }

}

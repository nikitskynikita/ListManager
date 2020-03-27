//
//  RootTableViewController.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit


class RootTableViewController: UITableViewController {

    private let dataSourceFactory: TableManagerFactory = SimpleTableManagerFactory()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationTableViewController = segue.destination as? ConfigurableTableViewController
            else {
                return
        }
        switch segue.identifier {
        case "SingleSectionTableViewController":
            destinationTableViewController.dataSource = dataSourceFactory.makeSingleSectionDataSource()
        case "MultipleSectionTableViewController":
            destinationTableViewController.dataSource = dataSourceFactory.makeMultipleSectionDataSource()
            destinationTableViewController.delegate = dataSourceFactory.makeMultipleSectionDelegate()
        default:
            break
        }
    }

}

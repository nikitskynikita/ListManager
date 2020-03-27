//
//  RootCollectionViewController.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit


class RootCollectionViewController: UITableViewController {

    private let dataSourceFactory: CollectionManagerFactory = SimpleCollectionManagerFactory()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationTableViewController = segue.destination as? ConfigurableCollectionViewController
            else {
                return
        }
        switch segue.identifier {
        case "SingleSectionCollectionViewController":
            destinationTableViewController.dataSource = dataSourceFactory.makeSingleSectionDataSource()
        case "MultipleSectionCollectionViewController":
            destinationTableViewController.dataSource = dataSourceFactory.makeMultipleSectionDataSource()
        default:
            break
        }
    }

}

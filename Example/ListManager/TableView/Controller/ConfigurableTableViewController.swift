//
//  ConfigurableTableViewController.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit
import ListManager

class ConfigurableTableViewController: UITableViewController {

    var dataSource: UITableViewDataSource?
    var delegate: UITableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerHeaders()
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }

}

extension ConfigurableTableViewController {

    func registerHeaders() {
        tableView.register(TextTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "TextTableViewHeader")
    }

}

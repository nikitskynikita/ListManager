//
//  ConfigurableCollectionViewController.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit
import ListManager

class ConfigurableCollectionViewController: UICollectionViewController {

    var dataSource: UICollectionViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerHeaders()
        collectionView?.dataSource = dataSource
    }

}

extension ConfigurableCollectionViewController {

    func registerHeaders() {
        collectionView?.register(UINib(nibName: "TextCollectionViewHeader", bundle: nil),
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: "TextCollectionViewHeader")
    }

}

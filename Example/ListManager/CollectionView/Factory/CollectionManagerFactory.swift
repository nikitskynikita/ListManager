//
//  CollectionManagerFactory.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit


protocol CollectionManagerFactory {
    func makeSingleSectionDataSource() -> UICollectionViewDataSource?
    func makeMultipleSectionDataSource() -> UICollectionViewDataSource?
}

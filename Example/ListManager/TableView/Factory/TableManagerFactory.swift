//
//  TableManagerFactory.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit


protocol TableManagerFactory {
    func makeSingleSectionDataSource() -> UITableViewDataSource?
    func makeMultipleSectionDataSource() -> UITableViewDataSource?
    func makeMultipleSectionDelegate() -> UITableViewDelegate?
}

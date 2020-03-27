//
//  SystemTableViewCell.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit
import ListManager


class TextTableViewCell: UITableViewCell, Configurable {

    var configure: TextViewModelProtocol? {
        didSet {
            textLabel?.text = configure?.text
        }
    }

}

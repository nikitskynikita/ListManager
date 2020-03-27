//
//  DetailedTextTableViewCell.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit
import ListManager

class DetailedTextTableViewCell: UITableViewCell, Configurable {

    var configure: DetailedTextViewModelProtocol?{
        didSet {
            textLabel?.text = configure?.text
            detailTextLabel?.text = configure?.detailedText
        }
    }

}

//
//  UITableView+ListView.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit


// MARK: - Реализация представления упорядоченного списка `ListView` для `UITableView`.
extension UITableView: ListView {
    
    public func dequeueHeader(with identifier: String, for indexPath: IndexPath) -> UITableViewHeaderFooterView? {
        return dequeueReusableHeaderFooterView(withIdentifier: identifier)
    }
    
    public func dequeueCell(with identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    public func dequeueFooter(with identifier: String, for indexPath: IndexPath) -> UITableViewHeaderFooterView? {
        return dequeueReusableHeaderFooterView(withIdentifier: identifier)
    }
    
}

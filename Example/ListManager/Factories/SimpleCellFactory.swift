//
//  SimpleCellFactory.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import ListManager


struct SimpleCellFactory<Cell: ListViewCell & Configurable> {

    let identifier: String

    init(identifier: String, cellType: Cell.Type) {
        self.identifier = identifier
    }

}

// MARK: - ListViewCellFactory
extension SimpleCellFactory: ListViewCellFactory {

    func makeCell<List: ListView>(for list: List, at indexPath: IndexPath, with viewModel: ViewModel) -> List.Cell {
        let cell = list.dequeueCell(with: identifier, for: indexPath)

        guard
            var configurableCell = cell as? Cell,
            let configure = viewModel as? Cell.Configure
            else {
                return cell
        }

        configurableCell.configure = configure

        return cell
    }

}

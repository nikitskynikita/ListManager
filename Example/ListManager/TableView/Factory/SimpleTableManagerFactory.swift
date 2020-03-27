//
//  SimpleTableManagerFactory.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import ListManager


class SimpleTableManagerFactory: TableManagerFactory {

    private let headerViewModels = [
        TextViewModel(text: "First Header"),
        TextViewModel(text: "Second Header")
    ]

    private let cellViewModels = [
        TextViewModel(text: "First Cell"),
        TextViewModel(text: "Cell #2"),
        TextViewModel(text: "This is also a text cell"),
        ValueSettingViewModel(parameter: "Size", value: 25),
        ValueSettingViewModel(parameter: "Opacity", value: 37),
        ValueSettingViewModel(parameter: "Blur", value: 13),
        SwitchedSettingViewModel(parameter: "Push notifications enabled", enabled: true),
        SwitchedSettingViewModel(parameter: "Camera access enabled", enabled: false),
    ]

    private lazy var sectionViewModels: [ListSectionViewModel] = {
        [
            SimpleSectionViewModel(header: headerViewModels.first, items: cellViewModels, footer: nil),
            SimpleSectionViewModel(header: headerViewModels.last, items: cellViewModels, footer: nil),
        ]
    }()

    func makeSingleSectionDataSource() -> UITableViewDataSource? {
        let dataProvider = SingleSectionListDataProvider(items: cellViewModels)
        var dataSource = TableViewDataSource(dataProvider: dataProvider)
        let textTableViewCellfactory = SimpleCellFactory(identifier: "TextTableViewCell",
                                                         cellType: TextTableViewCell.self)
        let detailedTextTableViewCellFactory = SimpleCellFactory(identifier: "DetailedTextTableViewCell",
                                                                 cellType: DetailedTextTableViewCell.self)
        let switchedSettingTableViewCellFactory = SimpleCellFactory(identifier: "SwitchedSettingTableViewCell",
                                                                    cellType: DetailedTextTableViewCell.self)
        dataSource.registerCellFactory(textTableViewCellfactory, for: TextViewModel.self)
        dataSource.registerCellFactory(detailedTextTableViewCellFactory, for: ValueSettingViewModel.self)
        dataSource.registerCellFactory(switchedSettingTableViewCellFactory, for: SwitchedSettingViewModel.self)

        return dataSource
    }

    func makeMultipleSectionDataSource() -> UITableViewDataSource? {
        let dataProvider = MultipleSectionListDataProvider(sections: sectionViewModels)
        var dataSource = TableViewDataSource(dataProvider: dataProvider)
        let textTableViewCellFactory = SimpleCellFactory(identifier: "TextTableViewCell",
                                                         cellType: TextTableViewCell.self)
        let detailedTextTableViewCellFactory = SimpleCellFactory(identifier: "DetailedTextTableViewCell",
                                                                 cellType: DetailedTextTableViewCell.self)
        let switchedSettingTableViewCellFactory = SimpleCellFactory(identifier: "SwitchedSettingTableViewCell",
                                                                    cellType: DetailedTextTableViewCell.self)
        dataSource.registerCellFactory(textTableViewCellFactory, for: TextViewModel.self)
        dataSource.registerCellFactory(detailedTextTableViewCellFactory, for: ValueSettingViewModel.self)
        dataSource.registerCellFactory(switchedSettingTableViewCellFactory, for: SwitchedSettingViewModel.self)

        return dataSource
    }

    func makeMultipleSectionDelegate() -> UITableViewDelegate? {
        let dataProvider = MultipleSectionListDataProvider(sections: sectionViewModels)
        var delegate = TableViewDelegate(dataProvider: dataProvider)
        let textTableViewHeaderFactory = SimpleHeaderFactory(identifier: "TextTableViewHeader",
                                                             headerType: TextTableViewHeader.self)
        delegate.registerHeaderFactory(textTableViewHeaderFactory, for: TextViewModel.self)

        return delegate
    }

}

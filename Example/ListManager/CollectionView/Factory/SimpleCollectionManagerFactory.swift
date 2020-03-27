//
//  SimpleCollectionManagerFactory.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import UIKit
import ListManager


class SimpleCollectionManagerFactory: CollectionManagerFactory {

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

    func makeSingleSectionDataSource() -> UICollectionViewDataSource? {
        let dataProvider = SingleSectionListDataProvider(items: cellViewModels)
        var dataSource = CollectionViewDataSource(dataProvider: dataProvider)
        let textCollectionViewCellFactory = SimpleCellFactory(identifier: "TextCollectionViewCell",
                                                              cellType: TextCollectionViewCell.self)
        let detailedTextCollectionViewCellFactory = SimpleCellFactory(identifier: "DetailedTextCollectionViewCell",
                                                                      cellType: DetailedTextCollectionViewCell.self)
        let switchedSettingCollectionViewCellFactory = SimpleCellFactory(identifier: "SwitchedSettingCollectionViewCell",
                                                                         cellType: DetailedTextCollectionViewCell.self)
        dataSource.registerCellFactory(textCollectionViewCellFactory, for: TextViewModel.self)
        dataSource.registerCellFactory(detailedTextCollectionViewCellFactory, for: ValueSettingViewModel.self)
        dataSource.registerCellFactory(switchedSettingCollectionViewCellFactory, for: SwitchedSettingViewModel.self)

        return dataSource
    }

    func makeMultipleSectionDataSource() -> UICollectionViewDataSource? {
        let dataProvider = MultipleSectionListDataProvider(sections: sectionViewModels)
        var dataSource = CollectionViewWithHeadersDataSource(dataProvider: dataProvider)
        let textCollectionViewHeaderFactory = SimpleHeaderFactory(identifier: "TextCollectionViewHeader",
                                                                  headerType: TextCollectionViewHeader.self)
        let textCollectionViewCellFactory = SimpleCellFactory(identifier: "TextCollectionViewCell",
                                                              cellType: TextCollectionViewCell.self)
        let detailedTextCollectionViewCellFactory = SimpleCellFactory(identifier: "DetailedTextCollectionViewCell",
                                                                      cellType: DetailedTextCollectionViewCell.self)
        let switchedSettingCollectionViewCellFactory = SimpleCellFactory(identifier: "SwitchedSettingCollectionViewCell",
                                                                         cellType: DetailedTextCollectionViewCell.self)
        dataSource.registerHeaderFactory(textCollectionViewHeaderFactory, for: TextViewModel.self)
        dataSource.registerCellFactory(textCollectionViewCellFactory, for: TextViewModel.self)
        dataSource.registerCellFactory(detailedTextCollectionViewCellFactory, for: ValueSettingViewModel.self)
        dataSource.registerCellFactory(switchedSettingCollectionViewCellFactory, for: SwitchedSettingViewModel.self)

        return dataSource
    }

}

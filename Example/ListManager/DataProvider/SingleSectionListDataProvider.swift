//
//  SimpleListDataProvider.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import ListManager


public struct SingleSectionListDataProvider: ListSingleSectionDataProvider {

    public let header: ViewModel?
    public let items: [ViewModel]
    public let footer: ViewModel?

    public init(
        header: ViewModel? = nil,
        items: [ViewModel] = [],
        footer: ViewModel? = nil
    ) {
        self.header = header
        self.items = items
        self.footer = footer
    }

}

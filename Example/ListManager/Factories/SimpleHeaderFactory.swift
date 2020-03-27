//
//  SimpleHeaderFactory.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import ListManager


struct SimpleHeaderFactory<Header: ListViewHeader & Configurable> {

    let identifier: String

    init(identifier: String, headerType: Header.Type) {
        self.identifier = identifier
    }

}

extension SimpleHeaderFactory: ListViewHeaderFactory {

    func makeHeader<List: ListView>(
        for list: List,
        at indexPath: IndexPath,
        with viewModel: ViewModel
    ) -> List.Header? {
        let header = list.dequeueHeader(with: identifier, for: indexPath)

        guard
            var configurableHeader = header as? Header,
            let configure = viewModel as? Header.Configure
            else {
                return header
        }

        configurableHeader.configure = configure

        return header
    }

}

//
//  SimpleSectionViewModel.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import ListManager


struct SimpleSectionViewModel: ListSectionViewModel {
    var header: ViewModel?
    var items: [ViewModel]
    var footer: ViewModel?
}

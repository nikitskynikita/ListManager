//
//  ValueSettingViewModel.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation


class ValueSettingViewModel: TextViewModel, DetailedTextViewModelProtocol {
    var detailedText: String { return String(value) }
    var value: Int
    
    init(parameter: String, value: Int) {
        self.value = value
        super.init(text: parameter)
    }
}

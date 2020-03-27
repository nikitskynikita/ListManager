//
//  SwitchedSettingViewModel.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation

class SwitchedSettingViewModel: TextViewModel, DetailedTextViewModelProtocol {
    var detailedText: String { return String(enabled) }
    var enabled: Bool
    
    init(parameter: String, enabled: Bool) {
        self.enabled = enabled
        super.init(text: parameter)
    }
}

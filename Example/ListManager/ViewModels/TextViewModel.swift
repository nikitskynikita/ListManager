//
//  TextViewModel.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//


class TextViewModel: TextViewModelProtocol {
    let text: String
    
    init(text: String) {
        self.text = text
    }
}

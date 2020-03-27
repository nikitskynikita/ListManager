//
//  ListSectionViewModel.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//


/// Описание модели представления секции упорядоченого списка.
public protocol ListSectionViewModel: ViewModel {
    
    /** Модель представления шапки секции. */
    var header: ViewModel? { get }
    
    /** Модели представления елементов упорядоченого списка. */
    var items: [ViewModel] { get }
    
    /** Модель представления подвал секции. */
    var footer: ViewModel? { get }
    
}

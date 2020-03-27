//
//  ViewModel.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//


/// Маркер модели представления.
public protocol ViewModel {}

public extension ViewModel {
    
    /** Наименование типа, помеченного как модель представления `ViewModel`. */
    static var typeName: String { String(describing: Self.self) }
    
}

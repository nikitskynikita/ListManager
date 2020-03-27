//
//  ConfigurableView.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//


/// Описание конфигурируемой сущности.
public protocol Configurable {
    
    associatedtype Configure // Тип конфигурации сущности.

    /** Конфигурация. */
    var configure: Configure? { get set }

}

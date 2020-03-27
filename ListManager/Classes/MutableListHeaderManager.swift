//
//  MutableListHeaderManager.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation


/// Описание изменяемой сущности, которая формирует представление упорядоченного списка.
public protocol MutableListHeaderManager: ListHeaderManager {

    /** Зарегистрированные фабрики для создания представления шапки секций. */
    var registeredHeaderFactories: [String: ListViewHeaderFactory] { get set }

    /**
     Регистрация фабрики для создания представления шапки секции.

     - Parameters:
        - factory: фабрика для создания представления.
        - viewModelType: тип модели представления шапки секции.
     */
    mutating func registerHeaderFactory<Model: ViewModel>(
        _ factory: ListViewHeaderFactory,
        for viewModelType: Model.Type
    )

}

// MARK: - Стандартная реализация основных методов `MutableListHeaderManager`.
public extension MutableListHeaderManager {

    mutating func registerHeaderFactory<Model: ViewModel>(
        _ factory: ListViewHeaderFactory,
        for viewModelType: Model.Type
    ) {
        let viewModelTypeString = viewModelType.typeName
        registeredHeaderFactories[viewModelTypeString] = factory
    }

}

//
//  MutableListFooterManager.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation


/// Описание изменяемой сущности, которая формирует представление упорядоченного списка.
public protocol MutableListFooterManager: ListFooterManager {

    /** Зарегистрированные фабрики для создания представления подвала секций. */
    var registeredFooterFactories: [String: ListViewFooterFactory] { get set }

    /**
    Регистрация фабрики для создания представления подвала секции.

    - Parameters:
       - factory: фабрика для создания представления.
       - viewModelType: тип модели представления подвала секции.
    */
    mutating func registerFooterFactory<Model: ViewModel>(
        _ factory: ListViewFooterFactory,
        for viewModelType: Model.Type
    )

}

// MARK: - Стандартная реализация основных методов `MutableListFooterManager`.
public extension MutableListFooterManager {

    mutating func registerFooterFactory<Model: ViewModel>(
        _ factory: ListViewFooterFactory,
        for viewModelType: Model.Type
    ) {
        let viewModelTypeString = viewModelType.typeName
        registeredFooterFactories[viewModelTypeString] = factory
    }

}

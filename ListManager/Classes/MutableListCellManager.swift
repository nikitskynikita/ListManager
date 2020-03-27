//
//  MutableListCellManager.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation


/// Описание изменяемой сущности, которая формирует представление упорядоченного списка.
public protocol MutableListCellManager: ListCellManager {

    /** Зарегистрированные фабрики для создания представления элементов упорядоченного списка. */
    var registeredCellFactories: [String: ListViewCellFactory] { get set }

    /**
    Регистрация фабрики для создания представления элементов упорядоченного списка.

    - Parameters:
       - factory: фабрика для создания представления.
       - viewModelType: тип модели представления элемента упорядоченного списка.
    */
    mutating func registerCellFactory<Model: ViewModel>(
        _ factory: ListViewCellFactory,
        for viewModelType: Model.Type
    )

}

// MARK: - Стандартная реализация основных методов `MutableListCellManager`.
public extension MutableListCellManager {

    mutating func registerCellFactory<Model: ViewModel>(
        _ factory: ListViewCellFactory,
        for viewModelType: Model.Type
    ) {
        let viewModelTypeString = viewModelType.typeName
        registeredCellFactories[viewModelTypeString] = factory
    }

}

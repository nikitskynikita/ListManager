//
//  ListHeaderManager.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation


/// Описание сущности, которая формирует представление шапок секций упорядоченного списка.
public protocol ListHeaderManager {

    /** Источник данных для формирования представления. */
    var dataProvider: ListDataProvider { get }

    /** Зарегистрированные фабрики для создания представления шапки секций. */
    var registeredHeaderFactories: [String: ListViewHeaderFactory] { get }

    /**
     Получение представления шапки секции по заданным параметрам.

     - Parameters:
        - list: представление упорядоченного списка, для которого необходимо получить представление.
        - indexPath: специальный путь, для которого будет предназначено представление.

     - Returns: представление шапки секции, если оно есть, иначе `nil`.
     */
    func resolveHeader<List: ListView>(for list: List, at indexPath: IndexPath) -> List.Header?

    /**
     Получение фабрики для создания представления шапки секции.

     - Parameters:
        - viewModel: модель представления шапки секции.

     - Returns: фабрика для создания представления, если она зарегистрированна, иначе `nil`.
     */
    func resolveHeaderFactory(viewModel: ViewModel) -> ListViewHeaderFactory?

}

// MARK: - Стандартная реализация основных методов `ListHeaderManager`.
public extension ListHeaderManager {

    func resolveHeader<List: ListView>(for list: List, at indexPath: IndexPath) -> List.Header? {
        guard
            let viewModel = dataProvider.header(in: indexPath.section),
            let factory = resolveHeaderFactory(viewModel: viewModel)
            else {
                return nil
        }

        let header = factory.makeHeader(for: list, at: indexPath, with: viewModel)

        return header
    }

    func resolveHeaderFactory(viewModel: ViewModel) -> ListViewHeaderFactory? {
        let viewModelType = type(of: viewModel)
        let viewModelTypeString = viewModelType.typeName
        return registeredHeaderFactories[viewModelTypeString]
    }

}

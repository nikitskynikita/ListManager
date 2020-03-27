//
//  ListFooterManager.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation


/// Описание сущности, которая формирует представление упорядоченного списка.
public protocol ListFooterManager {

    /** Источник данных для формирования представления. */
    var dataProvider: ListDataProvider { get }

    /** Зарегистрированные фабрики для создания представления подвала секций. */
    var registeredFooterFactories: [String: ListViewFooterFactory] { get }

    /**
    Получение представления подвала секции по заданным параметрам.

    - Parameters:
       - list: представление упорядоченного списка, для которого необходимо получить представление.
       - indexPath: специальный путь, для которого будет предназначено представление.

    - Returns: представление подвала секции, если оно есть, иначе `nil`.
    */
    func resolveFooter<List: ListView>(for list: List, at indexPath: IndexPath) -> List.Footer?

    /**
    Получение фабрики для создания представления подвала секции.

    - Parameters:
       - viewModel: модель представления подвала секции.

    - Returns: фабрика для создания представления, если она зарегистрированна, иначе `nil`.
    */
    func resolveFooterFactory(viewModel: ViewModel) -> ListViewFooterFactory?

}

// MARK: - Стандартная реализация основных методов `ListFooterManager`.
public extension ListFooterManager {

    func resolveFooter<List: ListView>(for list: List, at indexPath: IndexPath) -> List.Footer? {
        guard
            let viewModel = dataProvider.footer(in: indexPath.section),
            let factory = resolveFooterFactory(viewModel: viewModel)
            else {
                return nil
        }

        let footer = factory.makeFooter(for: list, at: indexPath, with: viewModel)

        return footer
    }

    func resolveFooterFactory(viewModel: ViewModel) -> ListViewFooterFactory? {
        let viewModelType = type(of: viewModel)
        let viewModelTypeString = viewModelType.typeName
        return registeredFooterFactories[viewModelTypeString]
    }

}

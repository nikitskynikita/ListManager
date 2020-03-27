//
//  ListCellManager.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation


/// Описание сущности, которая формирует представление ячеек упорядоченного списка.
public protocol ListCellManager {

    /** Источник данных для формирования представления. */
    var dataProvider: ListDataProvider { get }

    /** Зарегистрированные фабрики для создания представления элементов упорядоченного списка. */
    var registeredCellFactories: [String: ListViewCellFactory] { get }

    /**
     Получение представления элемента упорядоченного списка по заданным параметрам.

     - Parameters:
        - list: представление упорядоченного списка, для которого необходимо получить представление.
        - indexPath: специальный путь, для которого будет предназначено представление.
        - defaultCell: стандартное представление, если не получиться его получить.

     - Returns: представление элемента упорядоченного списка.
     */
    func resolveCell<List: ListView>(for list: List, at indexPath: IndexPath, defaultCell: List.Cell) -> List.Cell

    /**
     Получение фабрики для создания элемента представления упорядоченного списка.

     - Parameters:
        - viewModel: модель представления элемента упорядоченного списка.

     - Returns: фабрика для создания представления, если она зарегистрированна, иначе `nil`.
     */
    func resolveCellFactory(viewModel: ViewModel) -> ListViewCellFactory?

}

// MARK: - Стандартная реализация основных методов `ListCellManager`.
public extension ListCellManager {

    func resolveCell<List: ListView>(for list: List, at indexPath: IndexPath, defaultCell: List.Cell) -> List.Cell {
        guard
            let viewModel = dataProvider.item(at: indexPath),
            let factory = resolveCellFactory(viewModel: viewModel)
            else {
                return defaultCell
        }

        let cell = factory.makeCell(for: list, at: indexPath, with: viewModel)

        return cell
    }

    func resolveCellFactory(viewModel: ViewModel) -> ListViewCellFactory? {
        let viewModelType = type(of: viewModel)
        let viewModelTypeString = viewModelType.typeName
        return registeredCellFactories[viewModelTypeString]
    }

}

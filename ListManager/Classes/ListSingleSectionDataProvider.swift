//
//  ListSingleSectionDataProvider.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation


/// Описание сущности, которая предоставляет данные для создания представления упорядоченного списка с одной секцией.
public protocol ListSingleSectionDataProvider: ListDataProvider {

    /** Модель представления заголовка секции. */
    var header: ViewModel? { get }

    /** Модели представления элементов упорядоченного списка. */
    var items: [ViewModel] { get }

    /** Модель представления подвала секции. */
    var footer: ViewModel? { get }

}

// MARK: - Стандартная реализация основных методов `ListSingleSectionDataProvider`.
public extension ListSingleSectionDataProvider {

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfItems(in section: Int) -> Int {
        return items.count
    }

    func header(in section: Int) -> ViewModel? {
        return header
    }

    func item(at indexPath: IndexPath) -> ViewModel? {
        guard
            indexPath.item >= 0,
            indexPath.item < items.count
            else {
                return nil
        }

        return items[indexPath.item]
    }

    func footer(in section: Int) -> ViewModel? {
        return footer
    }

}

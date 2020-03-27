//
//  ListMultipleSectionDataProvider.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation


/// Описание сущности, которая предоставляет данные для создания представления упорядоченного списка с несколькими секциями.
public protocol ListMultipleSectionDataProvider: ListDataProvider {
    
    /** Модели представления секций упорядоченного списка. */
    var sections: [ListSectionViewModel] { get }

}

// MARK: - Стандартная реализация основных методов `ListMultipleSectionDataProvider`.
public extension ListMultipleSectionDataProvider {

    func numberOfSections() -> Int {
        return sections.count
    }

    func numberOfItems(in section: Int) -> Int {
        guard
            section >= 0,
            section < sections.count
            else {
                return 0
        }

        return sections[section].items.count
    }

    func header(in section: Int) -> ViewModel? {
        guard
            section >= 0,
            section < sections.count
            else {
                return nil
        }

        return sections[section].header
    }

    func item(at indexPath: IndexPath) -> ViewModel? {
        guard
            indexPath.section >= 0,
            indexPath.section < sections.count,
            indexPath.item >= 0,
            indexPath.item < sections[indexPath.section].items.count
            else {
                return nil
        }

        return sections[indexPath.section].items[indexPath.item]
    }

    func footer(in section: Int) -> ViewModel? {
        guard
            section >= 0,
            section < sections.count
            else {
                return nil
        }

        return sections[section].footer
    }

}

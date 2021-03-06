//
//  ListDataProvider.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//

import Foundation


/// Описание сущности, которая предоставляет данные для создания представления упорядоченного списка.
public protocol ListDataProvider {

    /**
     Количество секций в упорядоченном списке.

     - Returns: количество секций - неотрицательное целое число.
     */
    func numberOfSections() -> Int

    /**
     Количество элементов в указанной секции упорядоченного списка.

     - Parameters:
        - section: секция, для которой необходимо определить количество элементов.

     - Returns: количество элементов - неотрицательное целое число.
     */
    func numberOfItems(in section: Int) -> Int

    /**
     Получение модели представления шапки секции упорядоченного списка в указанной секции.

     - Parameters:
        - section: секция упорядоченного списка, для которой требуется модель представления.

     - Returns: модель представления, если таковая имеется, иначе `nil`.
     */
    func header(in section: Int) -> ViewModel?

    /**
     Получение модели представления элемента упорядоченного списка в указанной позиции.

     - Parameters:
        - indexPath: позиция упорядоченного списка, для которой требуется модель представления.

     - Returns: модель представления, если таковая имеется, иначе `nil`.
     */
    func item(at indexPath: IndexPath) -> ViewModel?

    /**
     Получение модели представления подвала секции упорядоченного списка в указанной секции.

     - Parameters:
        - section: секция упорядоченного списка, для которой требуется модель представления.

     - Returns: модель представления подвала секции упорядоченного списка, если таковая имеется, иначе `nil`.
     */
    func footer(in section: Int) -> ViewModel?

}

//
//  ListView.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//


/// Описание представления для упорядоченого списка.
public protocol ListView {

    associatedtype Header: ListViewHeader
    associatedtype Cell: ListViewCell
    associatedtype Footer: ListViewFooter

    /**
     Получение предсталения для шапки секции упорядоченного списка.

     - Parameters:
        - identifier: идентификатор представления шапки секции упорядоченного списка.
        - indexPath: специальный путь, для которого будет предназначено представление шапки секции.

     - Returns: представление в случае успеха, иначе `nil`.
     */
    func dequeueHeader(with identifier: String, for indexPath: IndexPath) -> Header?

    /**
     Получение предсталения для элемента упорядоченного списка.

     - Parameters:
        - identifier: идентификатор представления элемента упорядоченного списка.
        - indexPath: специальный путь, для которого будет предназначено представление элемента.

     - Returns: представление.
     */
    func dequeueCell(with identifier: String, for indexPath: IndexPath) -> Cell

    /**
     Получение предсталения для подвала секции упорядоченного списка.

     - Parameters:
        - identifier: идентификатор представления подвала секции упорядоченного списка.
        - indexPath: специальный путь, для которого будет предназначено представление подвала секции.

     - Returns: представление в случае успеха, иначе `nil`.
     */
    func dequeueFooter(with identifier: String, for indexPath: IndexPath) -> Footer?

}

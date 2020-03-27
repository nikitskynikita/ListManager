//
//  ListViewFooterFactory.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//


/// Описание фабрики для создания представления шапки секции упорядоченного списка.
public protocol ListViewFooterFactory {

    /**
     Создание представления для подвала секции упорядоченного списка по заданным параметрам.

     - Parameters:
        - list: представление упорядоченного списка, для которого будет созданно представление подвала секции.
        - indexPath: специальный путь, для которого будет предназначено представление подвала секции.
        - viewModel: модель представления, для которой будет созданно представление подвала секции.

     - Returns: созданное представление в случае успеха, иначе `nil`.
     */
    func makeFooter<List: ListView>(
        for list: List,
        at indexPath: IndexPath,
        with viewModel: ViewModel
    ) -> List.Footer?

}

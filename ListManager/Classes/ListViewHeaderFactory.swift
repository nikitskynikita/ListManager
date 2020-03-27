//
//  ListViewHeaderFactory.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//


/// Описание фабрики для создания представления шапки секции упорядоченного списка.
public protocol ListViewHeaderFactory {

    /**
     Создание представления для шапки секции упорядоченного списка по заданным параметрам.

     - Parameters:
        - list: представление упорядоченного списка, для которого будет созданно представление шапки секции.
        - indexPath: специальный путь, для которого будет предназначено представление шапки секции.
        - viewModel: модель представления, для которой будет созданно представление шапки секции.

     - Returns: созданное представление в случае успеха, иначе `nil`.
     */
    func makeHeader<List: ListView>(
        for list: List,
        at indexPath: IndexPath,
        with viewModel: ViewModel
    ) -> List.Header?

}

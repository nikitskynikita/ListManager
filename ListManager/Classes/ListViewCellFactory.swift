//
//  ListViewCellFactory.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//


/// Описание фабрики для создания представления элемента упорядоченного списка.
public protocol ListViewCellFactory {

    /**
     Создание представления для элемента упорядоченного списка по заданным параметрам.

     - Parameters:
        - list: представление упорядоченного списка, для которого будет созданно представление элемента.
        - indexPath: специальный путь, для которого будет предназначено представление элемента.
        - viewModel: модель представления, для которой будет созданно представление элемента.

     - Returns: созданное представление.
     */
    func makeCell<List: ListView>(
        for list: List,
        at indexPath: IndexPath,
        with viewModel: ViewModel
    ) -> List.Cell

}

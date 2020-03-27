//
//  MutableListSingleSectionDataProvider.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//


/// Описание изменяемой сущности, которая предоставляет данные для создания представления упорядоченного списка с одной секцией.
/// Используется для изменения набора моделей представления для контента во время выполнения.
public protocol MutableListSingleSectionDataProvider: ListSingleSectionDataProvider {
    
    var header: ViewModel? { get set }
    var items: [ViewModel] { get set }
    var footer: ViewModel? { get set }
    
}

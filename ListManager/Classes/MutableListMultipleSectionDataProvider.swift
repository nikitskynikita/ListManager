//
//  MutableListMultipleSectionDataProvider.swift
//  ListManager
//
//  Created by Nikita Nikitsky on 03/27/2020.
//  Copyright (c) 2020 Nikita Nikitsky. All rights reserved.
//


/// Описание изменяемой сущности, которая предоставляет данные для создания представления упорядоченного списка с несколькими секциями.
/// Используется для изменения набора моделей представления для контента во время выполнения.
public protocol MutableListMultipleSectionDataProvider: ListMultipleSectionDataProvider {
    
    var sections: [ListSectionViewModel] { get set }
    
}

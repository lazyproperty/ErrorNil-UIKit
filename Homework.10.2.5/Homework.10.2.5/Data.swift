//
//  Data.swift
//  Homework.10.2.5
//
//  Created by Sergey A on 19.03.2025.


import Foundation



struct TableData {
    let name: String
    let image: String
    let description: String
    var isCompleted: Bool = false
    
    static func getAll() -> [[TableData]]{
        [
            [
                TableData(name: "Сергей", image: "figure.stairs", description: ""),
                TableData(name: "Дима", image: "figure.wave", description: ""),
                TableData(name: "Тагир", image: "figure.run", description: ""),
                TableData(name: "Руслан", image: "figure", description: ""),
                TableData(name: "Катя", image: "figure.stand.dress", description: ""),
            ],
            
            [
                TableData(name: "Module 1", image: "figure.walk.arrival", description: "Swift"),
                TableData(name: "Module 2", image: "laptopcomputer", description: "UIKit"),
                TableData(name: "Module 3", image: "desktopcomputer.and.macbook", description: "Разработка"),
                TableData(name: "Module 4", image: "figure.walk.departure", description: "SwiftUI"),
                TableData(name: "Module 5", image: "app.connected.to.app.below.fill", description: "Git"),
            ]
        ]
    }
}




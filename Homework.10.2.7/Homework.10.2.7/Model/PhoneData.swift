//
//  Data.swift
//  Homework.10.2.7
//
//  Created by Sergey A on 25.03.2025.
//

import Foundation

struct PhoneData {
    let image: String
    let price: String
    let name: String
    
    static var description: String {
        "Тип смартфон \nОперационная система iOS 16 \nТип корпуса классический \nКонструкция водозащита \nМатериал корпуса стекло, керамика, нержавеющая сталь \nТип SIM-карты \nNano Sim + eSIM \nКоличество SIM-карт1 \nВес 240г \nРазмеры 160.7x77.6x7.85 мм"
    }
    
    static func getPhones() -> [PhoneData] {
        [
            PhoneData(image: "silver", price: "107990", name: "Apple iPhone 14 Pro 256Gb Silver"),
            PhoneData(image: "gold", price: "119990", name: "Apple iPhone 14 Pro 512Gb Gold"),
            PhoneData(image: "blue", price: "62990", name: "Apple iPhone 14 Pro 128Gb Blue"),
            PhoneData(image: "star", price: "200990", name: "Apple iPhone 14 Pro 1Tb Star"),
            PhoneData(image: "silver", price: "107990", name: "Apple iPhone 14 Pro 256Gb Silver"),
            PhoneData(image: "gold", price: "119990", name: "Apple iPhone 14 Pro 512Gb Gold"),
            PhoneData(image: "blue", price: "62990", name: "Apple iPhone 14 Pro 128Gb Blue"),
            PhoneData(image: "star", price: "200990", name: "Apple iPhone 14 Pro 1Tb Star"),
            PhoneData(image: "silver", price: "107990", name: "Apple iPhone 14 Pro 256Gb Silver"),
            PhoneData(image: "gold", price: "119990", name: "Apple iPhone 14 Pro 512Gb Gold"),
            PhoneData(image: "blue", price: "62990", name: "Apple iPhone 14 Pro 128Gb Blue"),
            PhoneData(image: "star", price: "200990", name: "Apple iPhone 14 Pro 1Tb Star"),
            PhoneData(image: "silver", price: "107990", name: "Apple iPhone 14 Pro 256Gb Silver"),
            PhoneData(image: "gold", price: "119990", name: "Apple iPhone 14 Pro 512Gb Gold"),
            PhoneData(image: "blue", price: "62990", name: "Apple iPhone 14 Pro 128Gb Blue"),
            PhoneData(image: "star", price: "200990", name: "Apple iPhone 14 Pro 1Tb Star"),
            PhoneData(image: "silver", price: "107990", name: "Apple iPhone 14 Pro 256Gb Silver"),
            PhoneData(image: "gold", price: "119990", name: "Apple iPhone 14 Pro 512Gb Gold"),
            PhoneData(image: "blue", price: "62990", name: "Apple iPhone 14 Pro 128Gb Blue"),
            PhoneData(image: "star", price: "200990", name: "Apple iPhone 14 Pro 1Tb Star"),
        ]
    }
    
}

//
//  ContentData.swift
//  Hw.10.2.9
//
//  Created by Sergey A on 05.04.2025.
//

import Foundation

struct ContentItem: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    var header: String? = nil
    var name: String? = nil
    var text: String? = nil
}

struct ContentSection: Identifiable {
    let id: String = UUID().uuidString
    let items: [ContentItem]
    
    static func mockData() -> [ContentSection] {
        
        let storyItems = [
            ContentItem(image: "img1", name: "Имя"),
            ContentItem(image: "img2", name: "Имя"),
            ContentItem(image: "img3", name: "Имя"),
            ContentItem(image: "img4", name: "Имя"),
        ]
        
        let messageItems = [
            ContentItem(image: "img1", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            ContentItem(image: "img3", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            ContentItem(image: "img2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            ContentItem(image: "img4", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            ContentItem(image: "img5", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
        ]
        
        let newsItems = [
            ContentItem(image: "waves", header: "Заголовок", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            ContentItem(image: "waves", header: "Заголовок2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            ContentItem(image: "waves", header: "Заголовок3", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
        ]
        
        let bannerItems = [
            ContentItem(image: "waterfall"),
            ContentItem(image: "forest"),
        ]
        
        let storySection = ContentSection(items: storyItems)
        let messageSection = ContentSection(items: messageItems)
        let newsSection = ContentSection(items: newsItems)
        let bannersSection = ContentSection(items: bannerItems)
        
        return [storySection, messageSection, newsSection, bannersSection]
    }
}

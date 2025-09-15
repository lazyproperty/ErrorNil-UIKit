//error nil


//error nil

import Foundation

struct CollectionItem: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    var header: String? = nil
    var name: String? = nil
    var text: String? = nil
}

struct CollectionSection: Identifiable {
    let id: String = UUID().uuidString
    let items: [CollectionItem]
    

    static func mockData() -> [CollectionSection] {
        
        let storyItems = [
            CollectionItem(image: "img1", name: "Name1"),
            CollectionItem(image: "img2", name: "Name2"),
            CollectionItem(image: "img3", name: "Name3"),
            CollectionItem(image: "img4", name: "Name4"),
        ]
        
        let messageItems = [
            CollectionItem(image: "img1", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "img2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "img3", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "img4", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "img5", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
        ]
        
        let newsItems = [
            CollectionItem(image: "news1", header: "Заголовок", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "news2", header: "Заголовок2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "news3", header: "Заголовок3", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
        ]
        
        let bannerItems = [
            CollectionItem(image: "banner1"),
            CollectionItem(image: "banner2"),
            CollectionItem(image: "banner3"),
        ]
        
        let storySection = CollectionSection(items: storyItems)
        let messageSection = CollectionSection(items: messageItems)
        let newsSection = CollectionSection(items: newsItems)
        let bannersSection = CollectionSection(items: bannerItems)
        
        return [storySection, messageSection /*newsSection, bannersSection*/]
    }
}



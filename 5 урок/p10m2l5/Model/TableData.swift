//error nil

import Foundation


struct TableData{
    
    let image: String
    let text: String
    let description: String
    
    static func mocData() -> [[TableData]] {
        [
            [
                TableData(image: "square.and.arrow.up", text: "share", description: "qwertyuwer"),
                TableData(image: "rectangle.and.pencil.and.ellipsis", text: "pencil", description: ""),
                TableData(image: "pencil.tip", text: "tip", description: ""),
                TableData(image: "trash.slash.circle", text: "trash", description: "")
            ],
            [
                TableData(image: "square.grid.3x1.folder.badge.plus", text: "grid", description: ""),
                TableData(image: "square.and.arrow.up", text: "share", description: "qwertyuwer"),
                TableData(image: "rectangle.and.pencil.and.ellipsis", text: "pencil", description: ""),
                TableData(image: "pencil.tip", text: "tip", description: ""),
                TableData(image: "trash.slash.circle", text: "trash", description: ""),
                TableData(image: "square.grid.3x1.folder.badge.plus", text: "grid", description: ""),
                
            ],
            [
                TableData(image: "pencil.tip", text: "tip", description: "qwert"),
                TableData(image: "trash.slash.circle", text: "trash", description: "sfdgdhj"),
            ]
        ]
        
    }
}


// [ [1,2,3,4,5],[6,7,8,9] ]
//

let item = TableData.mocData()
let i = item[1]

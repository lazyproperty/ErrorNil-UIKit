//
//  BannerCell.swift
//  Hw.10.2.9
//
//  Created by Sergey A on 05.04.2025.
//

import UIKit

class BannerCell: UICollectionViewCell{
    
    static let reuseIdentifier = "BannerCell"
    // фон
    lazy var cellImage: UIImageView = {
        $0.frame = CGRect(x: 0 , y: 0, width: bounds.width, height: bounds.height)
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellImage)
    }
    
    
    func configureCell(item: ContentItem){
        self.cellImage.image = UIImage(named: item.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

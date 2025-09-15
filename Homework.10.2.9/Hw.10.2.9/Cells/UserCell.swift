//
//  StoryCell.swift
//  Hw.10.2.9
//
//  Created by Sergey A on 05.04.2025.
//

import UIKit


class UserCell: UICollectionViewCell{
    static let reuseIdentifier = "UserCell"
    
    lazy var cellImage: UIImageView = {
        $0.frame = CGRect(x: 0 , y: 0, width: bounds.width, height: 80)
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var nameLabel: UILabel = {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.frame = CGRect(x: 0, y: cellImage.frame.maxY + 2, width: bounds.width, height: 20)
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellImage)
        contentView.addSubview(nameLabel)
    }
    
    func configureCell(item: ContentItem){
        self.cellImage.image = UIImage(named: item.image)
        self.nameLabel.text = item.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


//
//  CollectionCell.swift
//  Homework.10.2.7
//
//  Created by Sergey A on 26.03.2025.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier = "verticalCell"
    var completion: (() -> Void)?
    
    // картинка
    lazy var cellImage: UIImageView = {
        $0.frame.size = CGSize(width: contentView.frame.width, height: 170)
        $0.frame.origin.x = contentView.frame.origin.x
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    
    // price
    lazy var priceLabel: UILabel = {
        $0.frame.origin = CGPoint(x: 10, y: cellImage.frame.maxY + 5)
        $0.frame.size = CGSize(width: contentView.frame.width - 20, height: 15)
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textAlignment = .left
        $0.textColor = #colorLiteral(red: 0.7949801087, green: 0.08464855701, blue: 0.2474427223, alpha: 1)
        $0.clipsToBounds = true
        return $0
    }(UILabel())
    
    
    // name
    lazy var nameLabel: UILabel = {
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        $0.frame.origin = CGPoint(x: 10, y: priceLabel.frame.maxY + 5)
        $0.frame.size = CGSize(width: contentView.frame.width - 20, height: 40)
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    // Кнопка Купить
    lazy var buyButton: UIButton = {
        $0.setTitle("Купить", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        $0.frame = CGRect(x: 10, y: nameLabel.frame.maxY + 5, width: contentView.frame.width - 20, height: 28)
        $0.layer.cornerRadius = 12
        $0.backgroundColor = UIColor(red: 86/255, green: 188/255, blue: 118/255, alpha: 1)
        
        return $0
    }(UIButton(primaryAction: UIAction(handler: { _ in
        self.completion?()
    } )))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellImage)
        contentView.addSubview(priceLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(buyButton)
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(item: PhoneData) {
        cellImage.image = UIImage(named: item.image)
        priceLabel.text = "\(item.price) ₽"
        nameLabel.text = item.name
    }
    
}

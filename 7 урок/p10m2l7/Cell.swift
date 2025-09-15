//
//  Cell.swift
//  p10m2l7
//
//  Created by Sergey A on 26.03.2025.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    static let reuseIdentifier = "CollectionCell"
    var completion: (() -> Void)?
    
    lazy var cellImage: UIImageView = {
        $0.frame.size = CGSize(width: 110, height: 120)
        $0.center.x = contentView.center.x
        $0.frame.origin.y = 30
        $0.backgroundColor = .gray
        return $0
    }(UIImageView())
    
    lazy var cellLabel: UILabel = {
        $0.font = .systemFont(ofSize: 16, weight: .black)
        $0.frame = CGRect(x: 10, y: cellImage.frame.maxY + 20, width: frame.size.width - 20, height: 18)
        return $0
    }(UILabel())
    
    
    lazy var priceLabel: UIButton = {
        $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .light)
        $0.frame = CGRect(x: 10, y: cellLabel.frame.maxY + 20, width: 70, height: 22)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .green
        $0.layer.cornerRadius = 11
        $0.clipsToBounds = true
        return $0
    }(UIButton(primaryAction: UIAction(handler: { _ in
        self.completion?()
    })))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellImage)
        contentView.addSubview(cellLabel)
        contentView.addSubview(priceLabel)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: CollectioModel) {
        cellImage.image = UIImage(named: item.image)
        cellLabel.text = item.name
        priceLabel.setTitle("$\(item.price)", for: .normal)
    }
}



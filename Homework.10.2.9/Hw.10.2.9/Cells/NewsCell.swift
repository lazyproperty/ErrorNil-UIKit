//
//  NewsCell.swift
//  Hw.10.2.9
//
//  Created by Sergey A on 05.04.2025.
//

import UIKit


class NewsCell: UICollectionViewCell{
    static let reuseIdentifier = "NewsCell"
    // фон
    lazy var cellImage: UIImageView = {
      //  $0.frame = CGRect(x: 0 , y: 0, width: bounds.width, height: bounds.height)
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false

        return $0
    }(UIImageView())
    
    
    lazy var headerLabel: UILabel = {
        $0.textColor = .white
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 30, weight: .heavy)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    lazy var textLabel: UILabel = {
        $0.textColor = .white
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellImage)
        contentView.addSubview(headerLabel)
        contentView.addSubview(textLabel)
      
        setupLayout()
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: cellImage.topAnchor, constant: 30),
            headerLabel.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor, constant: 20),
            
         //   textLabel.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor, constant: 20),
            textLabel.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: -20),
            textLabel.trailingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: -20)
        ])
    }
    func configureCell(item: ContentItem){
        self.cellImage.image = UIImage(named: item.image)
        self.headerLabel.text = item.header
        self.textLabel.text = item.text
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


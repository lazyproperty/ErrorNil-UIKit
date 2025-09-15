//
//  DetailCell.swift
//  Homework.10.2.7
//
//  Created by Sergey A on 26.03.2025.
//

import UIKit

class DetailCell: UICollectionViewCell {
    
    static let detailCellID = "DetailCell"
    
    lazy var imageView: UIImageView = {
        $0.frame.size = CGSize(width: contentView.frame.width, height: contentView.frame.height)
        $0.frame.origin.x = contentView.frame.origin.x
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: String) {
        imageView.image = UIImage(named: image)
    }
}

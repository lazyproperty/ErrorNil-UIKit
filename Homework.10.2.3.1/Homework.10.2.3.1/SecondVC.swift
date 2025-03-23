//
//  SecondVC.swift
//  Homework.10.2.3.1
//
//  Created by Sergey A on 15.03.2025.
//

import UIKit
import Foundation

class SecondVC: UIViewController {
    
    var buildingName: String?
    var complexImage: UIImage?
    var priceLabelText: String?
    var addressLabelText: String?
    
    lazy var viewWidth  = view.frame.width
    lazy var viewHeight = view.frame.height
    
    
    
    // Логотип
    lazy var logoImage: UIImageView = {
        let image = UIImage(named: "ligaStroyLogo")
        $0.image = image
        $0.frame = CGRect(x: view.frame.minX + 20, y: view.frame.minY + 110, width: 80, height: 40)
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 0
        return $0
    }(UIImageView())
    
    // Название комплекса
    
    lazy var buildingNameLabel: UILabel = createLabel(text: buildingName ?? "", origin: CGPoint(x: logoImage.frame.minX, y: logoImage.frame.maxY + 20) , fontSize: 20 , weight: .bold, color: .white)
    
    
    // Основная картинка
    lazy var complexImageView: UIImageView = {
        $0.image = complexImage
        $0.frame = CGRect(x: view.frame.minX + 10, y: buildingNameLabel.frame.minY + 50, width: viewWidth - 20, height: 200)
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 10
        
        return $0
    }(UIImageView())
    
    
    
    // прайс
    lazy var priceLabel: UILabel = createLabel(text: priceLabelText ?? "", origin: CGPoint(x: buildingNameLabel.frame.minX, y: complexImageView.frame.maxY + 20), fontSize: 16, weight: .bold, color: .white)
    
    
    // Адрес
    
    lazy var addressLabel: UILabel = createLabel(text: addressLabelText ?? "", origin: CGPoint(x: priceLabel.frame.minX, y: priceLabel.frame.maxY + 10), fontSize: 12, weight: .regular, color: .white)
    
    
    // Кнопка Назад
    
    lazy var backButton: UIButton = {
        $0.setTitle("Назад", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        $0.frame = CGRect(x: view.frame.minX + 20, y: view.frame.maxY - 120, width: viewWidth - 40, height: 60 )
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .systemBlue
        $0.addAction(action, for: .touchUpInside)
        
        return $0
    }(UIButton())
    
    
    lazy var action: UIAction = UIAction{ [weak self] btn in
        
        self?.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubviews(logoImage, buildingNameLabel, complexImageView, priceLabel, addressLabel, backButton)
        
    }
    
    
    
    
    
    
    
    // MARK: - Functions
    
    // создаем картинки
    
    private func createImageView(image: String, frame: CGRect, isCircle: Bool = false, cornerRadius: CGFloat, backgroundColor: UIColor? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = frame
        imageView.backgroundColor = backgroundColor
        if isCircle {
            imageView.layer.cornerRadius = frame.width / 2
        } else {
            imageView.layer.cornerRadius = cornerRadius
        }
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    
    // создаем лейбл
    
    func createLabel(text: String, origin: CGPoint, fontSize: CGFloat, weight: UIFont.Weight, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textColor = color
        // label.backgroundColor = .gray
        label.font = .systemFont(ofSize: fontSize, weight: weight)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.frame.origin = origin
        
        return label
    }
    
}

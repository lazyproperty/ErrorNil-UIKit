//
//  ViewController.swift
//  Homework.10.2.2.2
//
//  Created by Sergey A on 09.03.2025.
//


import UIKit

class ViewController: UIViewController {
    
    lazy var viewWidth = view.frame.width
    
    // AppName
    lazy var appName: UILabel = {
        let label = UILabel()
        label.text = "AppName"
        label.textColor = .myText
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .center
        label.frame.origin = CGPoint(x: view.frame.minX + 30, y: view.frame.minY + 70)
        label.sizeToFit()
        return label
    }()
    
    // Основная картинка
    lazy var mainImage = createImage(imageName: "girl", frame: CGRect(x: appName.frame.minX, y: appName.frame.maxY + 30, width: viewWidth - 60, height: 370))
    
    // Имя
    lazy var nameLabel: UILabel = createLabel(text: "Имя", origin: CGPoint(x: mainImage.frame.minX + 30, y: mainImage.frame.maxY - 70), fontSize: 20, weight: .bold)
    
    // Фамилия
    lazy var surnameLabel = createLabel(text: "Фамилия", origin: CGPoint(x: nameLabel.frame.maxX + 5, y: nameLabel.frame.minY), fontSize: 20, weight: .bold)
    
    // Возраст
    lazy var ageLabel: UILabel = createLabel(text: "25 лет", origin: CGPoint(x: nameLabel.frame.minX, y: nameLabel.frame.maxY + 2), fontSize: 18, weight: .regular)
    
    // Значок
    lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "myIcon")
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        icon.frame = CGRect(x: surnameLabel.frame.maxX + 5, y: surnameLabel.frame.minY, width: 29, height: 29)
        return icon
    }()
    
    // Dislike
    lazy var dislikeImage: UIImageView = createImage(imageName: "dislike", frame: CGRect(x: mainImage.frame.minX + 5, y: mainImage.frame.maxY + 30, width: 60, height: 60), isCircle: true)
    
    // Кнопка Написать
    lazy var writeButton: UIButton = {
        let button = UIButton()
        let buttonWidth: CGFloat = mainImage.frame.width / 2
        button.setTitle("Написать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemGreen
        button.frame = CGRect(x: mainImage.frame.midX - buttonWidth / 2 , y: mainImage.frame.maxY + 35, width: buttonWidth, height: 50)
        
        return button
    }()
    
    // Like
    lazy var likeImage: UIImageView = createImage(imageName: "like", frame: CGRect(x: mainImage.frame.maxX - 65, y: mainImage.frame.maxY + 30, width: 60, height: 60), isCircle: true)
    

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(appName, mainImage, nameLabel, surnameLabel, ageLabel, iconImage, dislikeImage, writeButton, likeImage)
    }
    
    // MARK: - Functions
    
    // Функция для создания картинок
    func createImage(imageName: String, frame: CGRect, isCircle: Bool = false) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = frame
        if isCircle {
            imageView.layer.cornerRadius = imageView.frame.width / 2
            imageView.clipsToBounds = true
        } else {
            imageView.layer.cornerRadius = 30
            imageView.clipsToBounds = true
        }
        return imageView
    }
    
    
    // функция для создания лейблов
    func createLabel(text: String, origin: CGPoint, fontSize: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = .systemFont(ofSize: fontSize, weight: weight)
        label.textAlignment = .center
        label.sizeToFit()
        label.frame.origin = origin
        
        return label
    }
}

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

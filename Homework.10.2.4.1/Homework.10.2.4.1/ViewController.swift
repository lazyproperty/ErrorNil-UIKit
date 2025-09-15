//
//  ViewController.swift
//  Homework.10.2.4.1
//
//  Created by Sergey A on 17.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    // фото профиля
    lazy var profileImageView: UIImageView = {
        $0.image = UIImage(named: "girl")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIImageView())
    
    // имя фамилия
    lazy var nameLabel: UILabel = createLabel(text: "Имя Фамилия", fontSize: 20, weight: .bold, color: .black)
    
    // Основной канвас
    lazy var mainCanvas: UIView = {
        $0.backgroundColor = .systemGray5
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    // фото
    lazy var photo: UIImageView = createImageView(image: "eagle")
    
    // заголовок
    lazy var titleLabel: UILabel = createLabel(text: "Заголовок", fontSize: 20, weight: .heavy, color: .black)
    
    // описание
    lazy var descriptionLabel: UILabel = createLabel(text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore", fontSize: 15, weight: .regular, color: .black)
    
    // кнопка next
    lazy var nextButton: UIButton = {
        $0.setTitle("next", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        $0.backgroundColor = .systemGreen
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton())
    
    
    
    // MARK: - vieDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        mainCanvas.addSubviews(photo, titleLabel, descriptionLabel, nextButton)
        view.addSubviews(profileImageView, nameLabel, mainCanvas)
        
        setupLayout()
    }
    
    
    
    // MARK: - Functions
    
    // создаем ImageView
    private  func createImageView(image: String, isCircle: Bool = false, backgroundColor: UIColor? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = backgroundColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if isCircle {
            imageView.layer.cornerRadius = imageView.frame.width / 2
        } else {
            imageView.layer.cornerRadius = 30
        }
        imageView.clipsToBounds = true
        return imageView
    }
    
    
    // создаем Label
    private func createLabel(text: String, fontSize: CGFloat, weight: UIFont.Weight, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = .systemFont(ofSize: fontSize, weight: weight)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    
    // настраиваем Layout
    private func setupLayout() {
        NSLayoutConstraint.activate([
            // фото профиля
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            // имя фамилия
            nameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            // основной канвас
            mainCanvas.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            mainCanvas.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainCanvas.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            // фото
            photo.topAnchor.constraint(equalTo: mainCanvas.topAnchor, constant: 20),
            photo.leadingAnchor.constraint(equalTo: mainCanvas.leadingAnchor, constant: 20),
            photo.trailingAnchor.constraint(equalTo: mainCanvas.trailingAnchor, constant: -20),
            photo.heightAnchor.constraint(equalToConstant: 250),
            // заголовок
            titleLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: mainCanvas.leadingAnchor, constant: 40),
            // описание
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: mainCanvas.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: mainCanvas.trailingAnchor, constant: -30),
            // кнопка next
            nextButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            nextButton.leadingAnchor.constraint(equalTo: mainCanvas.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: mainCanvas.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.bottomAnchor.constraint(equalTo: mainCanvas.bottomAnchor, constant: -30),
        ])
        
        profileImageView.layer.cornerRadius = 50
        mainCanvas.layer.cornerRadius = 30
        nextButton.layer.cornerRadius = 20
        
    }
}


// MARK: - Extension

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

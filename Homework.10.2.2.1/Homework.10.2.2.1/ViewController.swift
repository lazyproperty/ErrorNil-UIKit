//
//  ViewController.swift
//  Homework.10.2.2.1
//
//  Created by Sergey A on 09.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var viewWidth = view.frame.width
    
    // Две картинки
    lazy var mountainView = createImageView(imageName: "Mountains", frame: CGRect(x: 0, y: -40, width: viewWidth, height: 160))
    lazy var coupleView = createImageView(imageName: "Couple", frame: CGRect(x: 30, y: mountainView.frame.maxY + 40, width: 100, height: 100), isCircular: true)
    
    // Имя кложуром
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        //  label.backgroundColor = .systemGray4
        label.textColor = .myText
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.frame.origin = CGPoint(x: coupleView.frame.maxX + 10, y: coupleView.frame.minY + 20)
        label.sizeToFit()
        return label
    }()
    
    // Фамилию функцией
    lazy var surnameLabel = createLabel(text: "Фамилия", origin: CGPoint(x: nameLabel.frame.maxX + 5, y: nameLabel.frame.minY), fontSize: 20, fontWeight: .bold)
    
    // Кнопка Редактировать
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("редактировать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.frame = CGRect(x: nameLabel.frame.minX, y: nameLabel.frame.maxY + 10, width: 150, height: 30)
        
        return button
    }()
    
    // Добавить описание
    lazy var addDiscriptionLabel = createLabel(text: "Добавить описание", origin: CGPoint(x: coupleView.frame.minX, y: coupleView.frame.maxY + 40), fontSize: 15, fontWeight: .regular)
    
    // TextView для описания
    lazy var discriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemGray6
        textView.layer.cornerRadius = 15
        textView.frame = CGRect(x: addDiscriptionLabel.frame.minX, y: addDiscriptionLabel.frame.maxY + 10, width: viewWidth - 60, height: 120)
        return textView
    }()
    
    // Изменить пароль
    lazy var changePasswordLabel = createLabel(text: "Изменить пароль", origin: CGPoint(x: discriptionTextView.frame.minX, y: discriptionTextView.frame.maxY + 30), fontSize: 15, fontWeight: .regular)
    
    // TextField для старого пароля
    lazy var oldPasswordTextField = createTextField(placeholder: "Старый пароль", origin: CGPoint(x: changePasswordLabel.frame.minX, y: changePasswordLabel.frame.maxY + 10))
    // TextField для нового пароля
    lazy var newPasswordTextField = createTextField(placeholder: "Новый пароль", origin: CGPoint(x: oldPasswordTextField.frame.minX, y: oldPasswordTextField.frame.maxY + 10))
    
    // Кнопка Сохранить
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.frame = CGRect(x: 30, y: view.frame.maxY - 100, width: viewWidth - 60, height: 60)
        return button
    }()
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(mountainView, coupleView, nameLabel, surnameLabel, editButton, addDiscriptionLabel, discriptionTextView, changePasswordLabel, oldPasswordTextField, newPasswordTextField, saveButton)
        
        
    }
    
    
    
    // MARK: - Functions
    
    // функция для создания картинок
    func createImageView(imageName: String, frame: CGRect, isCircular: Bool = false) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = frame
        if isCircular {
            imageView.layer.cornerRadius = imageView.frame.width / 2
            imageView.clipsToBounds = true
        }
        return imageView
    }
    
    // функция для создания лейблов
    func createLabel(text: String, origin: CGPoint, fontSize: CGFloat, fontWeight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .myText
        label.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        label.textAlignment = .center
        label.sizeToFit()
        label.frame.origin = origin
        
        return label
    }

    
    // Текстфилды для старого и нового паролей
    func createTextField(placeholder: String, origin: CGPoint) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.isSecureTextEntry = true
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.frame.size  = CGSize(width: viewWidth - 60, height: 40)
        textField.frame.origin = origin
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.rightViewMode = .always
        
        return textField
    }
}


extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}



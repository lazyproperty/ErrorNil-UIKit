//
//  ViewController.swift
//  Homework.10.2.1.1
//
//  Created by Sergey A on 09.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let imyaLabel: UILabel = UILabel()
    let nameLabel: UILabel = UILabel()
    
    let familiyaLabel: UILabel = UILabel()
    let surnameLabel: UILabel = UILabel()
    
    let nomerPotokaLabel: UILabel = UILabel()
    let streamNumberLabel: UILabel = UILabel()
    
    let addButton: UIButton = UIButton()
    let clearButton: UIButton = UIButton()
    
    lazy var action = UIAction{ action in
        if let button = action.sender as? UIButton {
            print( button.currentTitle ?? "")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imyaLabel.frame = CGRect(x: 50, y: 100, width: 45, height: 19)
        imyaLabel.text = "Имя:"
        imyaLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        imyaLabel.font = UIFont.systemFont(ofSize: 16, weight: .init(rawValue: 0.65))
        view.addSubview(imyaLabel)

        nameLabel.frame = CGRect(x: 100, y: 100, width: 87, height: 19)
        nameLabel.text = "Name"
        nameLabel.textColor = #colorLiteral(red: 1, green: 0.1491003036, blue: 0, alpha: 1)
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .init(rawValue: 0.65))
        view.addSubview(nameLabel)

    //
        familiyaLabel.frame = CGRect(x: 50, y: 130, width: 87, height: 19)
        familiyaLabel.text = "Фамилия:"
        familiyaLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        familiyaLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(0.65))
        view.addSubview(familiyaLabel)

        surnameLabel.frame = CGRect(x: 142, y: 130, width: 87, height: 19)
        surnameLabel.text = "Surname"
        surnameLabel.textColor = #colorLiteral(red: 1, green: 0.1491003036, blue: 0, alpha: 1)
        surnameLabel.font = UIFont.systemFont(ofSize: 16, weight: .init(rawValue: 0.65))
        view.addSubview(surnameLabel)

    //
        nomerPotokaLabel.frame = CGRect(x: 50, y: 160, width: 130, height: 19)
        nomerPotokaLabel.text = "Номер потока:"
        nomerPotokaLabel.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        nomerPotokaLabel.font = UIFont.systemFont(ofSize: 16, weight: .init(rawValue: 0.65))
        view.addSubview(nomerPotokaLabel)

        streamNumberLabel.frame = CGRect(x: 185, y: 160, width: 55, height: 19)
        streamNumberLabel.text = "iOS 10"
        streamNumberLabel.textColor = #colorLiteral(red: 1, green: 0.1491003036, blue: 0, alpha: 1)
        streamNumberLabel.font = UIFont.systemFont(ofSize: 16, weight: .init(rawValue: 0.65))
        view.addSubview(streamNumberLabel)

        
        
        // addButton
        addButton.frame = CGRect(x: 20, y: view.frame.height - 200, width: view.frame.width - 40, height: 60)
        addButton.setTitle("Добавить данные", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .init(rawValue: 0.0))
        addButton.backgroundColor = .black
        addButton.layer.cornerRadius = 20
        addButton.addAction(action, for: .touchUpInside)
        view.addSubview(addButton)
        
        // cleanButton
        clearButton.frame = CGRect(x: 20, y: addButton.frame.origin.y + addButton.frame.height + 10, width: view.frame.width - 40, height: 60)
        clearButton.setTitle("Очистить данные", for: .normal)
        clearButton.setTitleColor(UIColor(#colorLiteral(red: 0, green: 0.342866838, blue: 1, alpha: 1)), for: .normal)
        clearButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .init(rawValue: 0.0))
        clearButton.layer.cornerRadius = 20
        clearButton.addAction(action, for: .touchUpInside)
        view.addSubview(clearButton)
        
    }
}


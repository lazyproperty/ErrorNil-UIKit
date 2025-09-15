//
//  ViewController.swift
//  Homework.10.2.1.2
//
//  Created by Sergey A on 09.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let subscriptionsLabel: UILabel = UILabel()
    let subscriptionsCountLabel: UILabel = UILabel()
    
    let subscribersLabel: UILabel = UILabel()
    let subscribersCountLabel: UILabel = UILabel()
    
    let postsLabel: UILabel = UILabel()
    let postsCountLabel: UILabel = UILabel()
    
    let addPostButton: UIButton = UIButton()
    let aboutMySelfLabel: UILabel = UILabel()
    let mySelfTextLabel: UILabel = UILabel()
    
    let outButton: UIButton = UIButton()
    
    
    lazy var addPost: UIAction = UIAction { _ in
        print("Добавить пост")
    }
    
    lazy var out: UIAction = UIAction { _ in
        print("Выйти")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Подписок
        subscriptionsLabel.frame = CGRect(x: 20, y: 140, width: 80, height: 30)
      //  subscriptionsLabel.backgroundColor = .systemGray4
        subscriptionsLabel.text = "Подписок"
        subscriptionsLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        subscriptionsLabel.textAlignment = .center
        view.addSubview(subscriptionsLabel)
        
        
        // 99
        subscriptionsCountLabel.frame = CGRect(x: 45, y: 170, width: 30, height: 30)
        //subscriptionsCountLabel.backgroundColor = .systemGray5
        subscriptionsCountLabel.text = "99"
        subscriptionsCountLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        subscriptionsCountLabel.textAlignment = .center
        view.addSubview(subscriptionsCountLabel)
        
        // Подписчиков
        subscribersLabel.frame = CGRect(x: view.frame.width / 2 - 55, y: 140, width: 110, height: 30)
       // subscribersLabel.backgroundColor = .systemGray4
        subscribersLabel.text = "Подписчиков"
        subscribersLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        subscribersLabel.textAlignment = .center
        view.addSubview(subscribersLabel)
        
        // 120
        subscribersCountLabel.frame = CGRect(x: view.frame.width / 2 - 17.5, y: 170, width: 35, height: 30)
        // subscribersCountLabel.backgroundColor = .tintColor
        subscribersCountLabel.text = "120"
        subscribersCountLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        subscribersCountLabel.textAlignment = .center
        
        view.addSubview(subscribersCountLabel)
        
        // Постов
        postsLabel.frame = CGRect(x: view.frame.maxX - 100, y: 140, width: 60, height: 30)
      //  postsLabel.backgroundColor = .systemGray4
        postsLabel.text = "Постов"
        postsLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        postsLabel.textAlignment = .center
        view.addSubview(postsLabel)
        
        // 300
        postsCountLabel.frame = CGRect(x: view.frame.maxX - 90, y: 170, width: 40, height: 30)
        postsCountLabel.text = "300"
       // postsCountLabel.backgroundColor = .systemGray5
        postsCountLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        postsCountLabel.textAlignment = .center
        view.addSubview(postsCountLabel)
        
        
        
        
        // Добавить пост
        addPostButton.frame = CGRect(x: 20, y: 230, width: view.frame.width - 40, height: 30)
        addPostButton.setTitle("Добавить пост", for: .normal)
        addPostButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        addPostButton.backgroundColor = .black
        addPostButton.layer.cornerRadius = 15
        addPostButton.addAction(addPost, for: .touchUpInside)
        view.addSubview(addPostButton)
        
        
        // О себе
        aboutMySelfLabel.frame = CGRect(x: 20, y: 300, width: 70, height: 30)
        aboutMySelfLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        aboutMySelfLabel.textAlignment = .left
        aboutMySelfLabel.text = "О себе"
        view.addSubview(aboutMySelfLabel)

        // Lorem ipsum
        mySelfTextLabel.frame = CGRect(x: 20, y: 330, width: view.frame.width - 40, height: 80)
        mySelfTextLabel.text = """
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
"""
        mySelfTextLabel.numberOfLines = 4
        mySelfTextLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        mySelfTextLabel.textAlignment = .left
        view.addSubview(mySelfTextLabel)
        
        
        // Выйти
        outButton.frame = CGRect(x: view.frame.width / 2 - 25, y: view.frame.maxY - 100, width: 50, height: 30)
        outButton.setTitle("Выйти", for: .normal)
        outButton.setTitleColor(.systemBlue, for: .normal)
        outButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        outButton.addAction(out, for: .touchUpInside)
        view.addSubview(outButton)
        
    }
}

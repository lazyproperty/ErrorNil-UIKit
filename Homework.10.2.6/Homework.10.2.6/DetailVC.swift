//
//  DetailVC.swift
//  Homework.10.2.6
//
//  Created by Sergey A on 22.03.2025.
//

import UIKit

class DetailVC: UIViewController {
    
    var post: PostData
    
    private lazy var postImage: UIImageView = {
        $0.image = UIImage(named: post.image)
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return $0
    }(UIImageView())
    
    lazy var nameLabel = createLabel(fontSize: 20, weight: .bold, text: post.name)
    lazy var dateLabel = createLabel(fontSize: 15, weight: .regular, text: post.date)
    lazy var textLabel = createLabel(fontSize: 15, weight: .regular, text: post.text)
    
    init(post: PostData) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubviews(postImage, nameLabel, dateLabel, textLabel)
        
        setupLayout()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            // картинка
            postImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            postImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            // имя
            nameLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: postImage.leadingAnchor),
            // дата
            dateLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: postImage.trailingAnchor),
            // основной текст
            textLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            textLabel.leadingAnchor.constraint(equalTo: postImage.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: postImage.trailingAnchor)
        ])
    }
    
    private func  createLabel(fontSize: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textAlignment = .left
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {addSubview($0)}
    }
}

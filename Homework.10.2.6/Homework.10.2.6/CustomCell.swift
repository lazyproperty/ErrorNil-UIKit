//
//  CustomCell.swift
//  Homework.10.2.6
//
//  Created by Sergey A on 22.03.2025.
//

import UIKit

class CustomCell: UITableViewCell {
    private lazy var cellView: UIView = {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 25
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(usernameLabel)
        $0.addSubview(postImage)
        $0.addSubview(titleLabel)
        $0.addSubview(dateLabel)
        $0.addSubview(mainText)
        $0.addSubview(nextButton)
        
        return $0
    }(UIView())
    
    // Имя Фамилия
    private lazy var usernameLabel = createLabel(fontSize: 20, weight: .heavy)
    
    // Картинка
    private lazy var postImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return $0
    }(UIImageView())
    
    // Заголовок
    private lazy var titleLabel: UILabel = createLabel(fontSize: 17, weight: .bold)
    
    // Дата
    private lazy var dateLabel: UILabel = createLabel(fontSize: 13, weight: .light)
    
    // Текст
    private lazy var mainText: UILabel = createLabel(fontSize: 15, weight: .regular)
    
    // Кнопка
    lazy var nextButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Next", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.layer.cornerRadius = 20
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        $0.backgroundColor = .systemGreen
        
        return $0
    }(UIButton())
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellView)
    }
    
    
    func configCell(postData: PostData){
        usernameLabel.text = postData.name
        postImage.image = UIImage(named: postData.image)
        titleLabel.text = postData.title
        dateLabel.text = postData.date
        mainText.text = postData.text
        
        setupLayout()
    }
    
    private func  createLabel(fontSize: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textAlignment = .left
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            
            usernameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            usernameLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            
            postImage.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20),
            postImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 18),
            postImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -18),
            
            titleLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 40),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 40),
            
            mainText.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            mainText.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            mainText.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            
            nextButton.topAnchor.constraint(equalTo: mainText.bottomAnchor, constant: 40),
            nextButton.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




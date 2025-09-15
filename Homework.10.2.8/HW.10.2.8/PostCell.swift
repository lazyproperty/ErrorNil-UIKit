//
//  PostCell.swift
//  HW.10.2.8
//
//  Created by Sergey A on 28.03.2025.
//

import UIKit

protocol CellProtocol {
    static var reuseID: String { get }
    func configure(with item: Post)
    func setupLayout()
}


class PostCell: UICollectionViewCell, CellProtocol {
    
    static var reuseID: String = "PostCell"
     let cellWidth = UIScreen.main.bounds.width - 10


    // author image
    lazy var authorImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 22
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // user name
    lazy var authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // post image
    lazy var postImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // post date
    lazy var postDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // post name
    lazy var postNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // post text
    lazy var postTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(authorImageView)
        contentView.addSubview(authorNameLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(postDateLabel)
        contentView.addSubview(postNameLabel)
        contentView.addSubview(postTextLabel)
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemGray5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Functions
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorImageView.image = nil
        authorNameLabel.text = nil
        postImageView.image = nil
        postDateLabel.text = nil
        postNameLabel.text = nil
        postTextLabel.text = nil
        
        postImageView.constraints.forEach { contr in
            postImageView.removeConstraint(contr)
        }
    }
    
    func configure(with item: Post) {
        authorImageView.image = UIImage(named: item.authorImage)
        authorNameLabel.text = item.authorName
        postImageView.image = UIImage(named: item.postImage)
        postDateLabel.text = item.postDate
        postNameLabel.text = item.postName
        postTextLabel.text = item.postText
        
        setupLayout()

        }
    
    
    func setupLayout() {
        if !postImageView.constraints.isEmpty { return }
        let imageRatio = postImageView.image?.getRatio() ?? 1
        print(imageRatio)
        let imageH = cellWidth * imageRatio
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: cellWidth - 20),

            // Author image
            authorImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            authorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            authorImageView.widthAnchor.constraint(equalToConstant: 44),
            authorImageView.heightAnchor.constraint(equalToConstant: 44),
            
            authorNameLabel.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: 20),
            authorNameLabel.centerYAnchor.constraint(equalTo: authorImageView.centerYAnchor),
            authorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            // PostImageView
            postImageView.topAnchor.constraint(equalTo: authorImageView.bottomAnchor, constant: 20),
            postImageView.leadingAnchor.constraint(equalTo: authorImageView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            postImageView.heightAnchor.constraint(equalToConstant: imageH),
          
            
            postDateLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            postDateLabel.leadingAnchor.constraint(equalTo: authorImageView.leadingAnchor),
            
            postNameLabel.topAnchor.constraint(equalTo: postDateLabel.bottomAnchor, constant: 10),
            postNameLabel.leadingAnchor.constraint(equalTo: authorImageView.leadingAnchor),
            postNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20), 
            
            postTextLabel.topAnchor.constraint(equalTo: postNameLabel.bottomAnchor, constant: 10),
            postTextLabel.leadingAnchor.constraint(equalTo: postNameLabel.leadingAnchor),
            postTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            postTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        
        ])
    }
}


extension UIImage{
    func getRatio() -> CGFloat{
        return self.size.height / self.size.width
    }
}


//error nil

import UIKit

class MessageCell: UICollectionViewCell{
    static let reuseIdentifier: String = "MessageCell"
    
    lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 60).isActive = true
        $0.layer.cornerRadius = 25
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var textLabel: UILabel = {
        $0.sizeToFit()
        $0.numberOfLines = 0
        $0.textAlignment = .left
       // $0.backgroundColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false

        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
        
        setupLayout()
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            textLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
            
        ])
    }
    
    func configureCell(item: ContentItem) {
        imageView.image = UIImage(named: item.image)
        textLabel.text = item.text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

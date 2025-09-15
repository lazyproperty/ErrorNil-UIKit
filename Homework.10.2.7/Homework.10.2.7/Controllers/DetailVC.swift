//
//  DetailVC.swift
//  Homework.10.2.7
//
//  Created by Sergey A on 25.03.2025.
//

import UIKit

class DetailVC: UIViewController {
    
    var item: PhoneData
    
    init(item: PhoneData) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var images: [String] = {
        return Array(repeating: self.item.image, count: 3)
    }()
    
    lazy var detailLayout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: view.frame.width - 10, height: 350)
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
        $0.sectionInset = .init(top: 30, left: 0, bottom: 30, right: 0)
        return $0
    }( UICollectionViewFlowLayout())
    
    lazy var imageHorizontalCollectionView: UICollectionView = {
        $0.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.detailCellID)
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .systemGray5
        $0.isPagingEnabled = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: detailLayout))
    
    
    
    // price label
    lazy var priceLabel = createLabel(text: item.price, fontSize: 30, weight: .bold, color: UIColor(red: 0.7949801087, green: 0.08464855701, blue: 0.2474427223, alpha: 1) )
    
    // name label
    lazy var nameLabel = createLabel(text: item.name, fontSize: 18, weight: .light, color: .black)
    
    // favor button
    private lazy var favorButton: UIButton = {
        $0.setTitle("В избранное", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(.black, for: .normal)
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    // buyButton
    private lazy var buyButton: UIButton = {
        $0.setTitle("Купить", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(.white, for: .normal)
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.backgroundColor = UIColor(red: 0.01105157193, green: 0.7484628558, blue: 0.4335443377, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    // это все ОДИН лейбл
    lazy var fullDescriptionLabel: UILabel = createLabel(text: PhoneData.description, fontSize: 14, weight: .light, color: .black)
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageHorizontalCollectionView.dataSource = self
        imageHorizontalCollectionView.delegate = self
        view.backgroundColor = UIColor(red: 0.9686273932, green: 0.9686273932, blue: 0.9686273932, alpha: 1)
        view.addSubviews(imageHorizontalCollectionView, priceLabel, nameLabel, favorButton, buyButton, fullDescriptionLabel)
        
        setupLayout()
        
    }
    
    
    // Setup Layout Func
    private func setupLayout() {
        NSLayoutConstraint.activate([
            //mainImageView
            imageHorizontalCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageHorizontalCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            imageHorizontalCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            imageHorizontalCollectionView.heightAnchor.constraint(equalToConstant: 350),
            // priceLabel
            priceLabel.topAnchor.constraint(equalTo: imageHorizontalCollectionView.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            priceLabel.heightAnchor.constraint(equalToConstant: 40),
            // name label
            nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),

            // favor Button
            favorButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            favorButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            favorButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 30),
            // buy Button
            buyButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            buyButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buyButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 30),
            // full description label
            fullDescriptionLabel.topAnchor.constraint(equalTo: favorButton.bottomAnchor, constant: 20),
            fullDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            fullDescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            fullDescriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            
            
            
        ])
    }
       
    
    
   // Create Label Func
        func createLabel(text: String, fontSize: CGFloat, weight: UIFont.Weight, color: UIColor) -> UILabel {
            let label = UILabel()
            label.text = text
            label.numberOfLines = 0
            label.textColor = color
            label.font = .systemFont(ofSize: fontSize, weight: weight)
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
           // label.backgroundColor = .gray
            return label
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }


extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
        }
    }
}

extension DetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.detailCellID, for: indexPath) as! DetailCell
        let item = images[indexPath.item]
        cell.configure(with: item)
        return cell
    }
    
    
}

extension DetailVC: UICollectionViewDelegate{
    
}

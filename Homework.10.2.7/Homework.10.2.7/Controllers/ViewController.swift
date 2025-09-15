//
//  ViewController.swift
//  Homework.10.2.7
//
//  Created by Sergey A on 25.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var phones: [PhoneData] = PhoneData.getPhones()
    
    
    // создаем layout для CollectionView
    lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
      //  $0.itemSize = .init(width: (view.frame.width - 30) / 2, height: 280)
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.minimumLineSpacing = 10
        $0.minimumInteritemSpacing = 5
        $0.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        return $0
    }( UICollectionViewFlowLayout())
    
    
    // создаем CollectionView
    lazy var phoneCollectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        //  $0.isPagingEnabled = true
        $0.dataSource = self
        $0.delegate = self
        $0.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
        $0.backgroundColor = .systemGray6
        $0.clipsToBounds = true
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layout))
    
    
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(phoneCollectionView)
        setupLayout()
    }
    
    // MARK: - Functions
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            phoneCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            phoneCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            phoneCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            phoneCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    
}


    // MARK: - Extensions

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phones.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseIdentifier, for: indexPath) as! CollectionCell
        cell.completion = {
            let detailVC = DetailVC(item: self.phones[indexPath.item])
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        cell.configure(item: phones[indexPath.item])
        return cell
    }
    
    
}


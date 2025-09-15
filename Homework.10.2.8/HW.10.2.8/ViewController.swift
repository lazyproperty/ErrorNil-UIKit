//
//  ViewController.swift
//  HW.10.2.8
//
//  Created by Sergey A on 28.03.2025.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    let posts: [Post] = Post.getPosts()
    var isToggled: Bool = true
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = .init(top: 20, left: 10, bottom: 10, right: 10)
        return layout
    }()
    
    lazy var postCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseID)
        collectionView.backgroundColor = .systemGray3
        collectionView.clipsToBounds = true
        return collectionView
    }()
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(postCollectionView)
        setupLayout()
        
        // Добавляем кнопку в Navigation Bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "tablecells"), style: .plain, target: self, action: #selector(toggleLayout))
    }
    
    
    // MARK: - Functions
    
    @objc func toggleLayout() {
           isToggled.toggle()

           if let layout = postCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
               UIView.animate(withDuration: 0.9) {
                   if self.isToggled {
                       layout.minimumLineSpacing = 10
                       layout.minimumInteritemSpacing = 5
                       layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                       layout.itemSize = .zero
                       layout.sectionInset = .init(top: 20, left: 10, bottom: 10, right: 10)
                       self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "tablecells")
                   } else {
                       layout.estimatedItemSize = .zero
                       layout.minimumLineSpacing = 10
                       layout.minimumInteritemSpacing = 10
                       layout.estimatedItemSize = .zero
                       layout.itemSize = CGSize(width: self.view.frame.width / 2 - 30, height: 400)
                       layout.sectionInset = .init(top: 20, left: 10, bottom: 10, right: 10)
                       self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "line.3.horizontal")
                   }
                   self.postCollectionView.collectionViewLayout.invalidateLayout()
                   self.postCollectionView.reloadData()
               }
           }
       }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            postCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            postCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Extensions
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.reuseID, for: indexPath) as! PostCell
        cell.configure(with: posts[indexPath.item])
        return cell
    }
}




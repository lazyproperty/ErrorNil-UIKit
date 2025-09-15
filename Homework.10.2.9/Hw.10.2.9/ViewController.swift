//
//  ViewController.swift
//  Hw.10.2.9
//
//  Created by Sergey A on 03.04.2025.
//

import UIKit

//UICollectionViewCompositionalLayout
//NSCollectionLayoutSection
class ViewController: UIViewController {
    
    //1 model - data
    private var collectionData = ContentSection.mockData()
    
    //2 коллекция
    //MARK: -- 1 - Cоздать коллекцию
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseIdentifier)
        $0.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.reuseIdentifier)
        $0.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseIdentifier)
        $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseIdentifier)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))
    
    
    
    
    // MARK: -                                                    ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
    
    
    //MARK: -- 2 - Создаем функцию которая вернет layout для каждой секции

    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            //MARK: -- 3 - Проверяем каждую секцию и возвращаем соответствующий layout
            switch section {
            case 0:
                return self.userSectionLayout()
            case 1:
                return self.messageSectionLayout()
            case 2:
                return self.newsSectionLayout()
            case 3:
                return self.bannersSectionLayout()
            default:
                fatalError("Unknown section \(section)")
            }
        }
    }
    
    
    //MARK: -- 4 - Функции которые создают layout для каждой секции
    
    ///userSectionLayout - создает layout для первой секции
    private func userSectionLayout() -> NSCollectionLayoutSection{
        ///item
        // 1- item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        // 2- item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        ///group
        // 1- group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(104))
        // 2- group
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        //если внутри группы 1 элемент, то отступы  пишем для группы!!!!
        group.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        ///section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 20)
        return section
    }
    
    
    /// Layout для второй секции
    private func messageSectionLayout() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(96))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 30)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 20)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    
    /// Layout для третьей секции
    private func newsSectionLayout() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 20)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 20)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 20)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    
    /// Layout для четвертой секции
    private func bannersSectionLayout() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 20, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 30, bottom: 20, trailing: 20)
        section.orthogonalScrollingBehavior = .none
        return section
    }
}




// MARK: - Extensions

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionData.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData[section].items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionData[indexPath.section].items[indexPath.item]
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCell.reuseIdentifier, for: indexPath) as! UserCell
            cell.configureCell(item: item)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCell.reuseIdentifier, for: indexPath) as! MessageCell
            cell.configureCell(item: item)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseIdentifier, for: indexPath) as! NewsCell
            cell.configureCell(item: item)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseIdentifier, for: indexPath) as! BannerCell
            cell.configureCell(item: item)
            return cell
        default:
            fatalError()
        }
        
    }
    
    
}


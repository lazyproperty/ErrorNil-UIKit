//error nil

import UIKit

//UICollectionViewCompositionalLayout
//NSCollectionLayoutSection
class ViewController: UIViewController {

    //1 model - data
    private var collectionData = CollectionSection.mockData()
    //2 коллекция
    
    //MARK: -- 1 - Cоздать коллекцию
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseIdentifier)
        $0.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.reuseIdentifier)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))
    //что бы автоматически подбирался layout по номеру секции!!!!
    
    
    //MARK: -- 2 - Создаем функцию которая вернет layout для каждой секции
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            //MARK: -- 3 - Проверяем каждую секцию и возвращаем соответствующий layout
            switch section {
            case 0:
                return self.storySectionLayout()
            default:
                return self.newsSectionLaout()
            }
        }
    }
    
    //MARK: -- 4 - Функции которые создают layout для каждой секции
    ///`storySectionLayout` - создает layout для первово секции
    private func storySectionLayout() -> NSCollectionLayoutSection{
        //item
            // 1- item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
            // 2- item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //group
            // 1- group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100),
                                               heightDimension: .absolute(104))
            // 2- group
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        //если внутри группы 1 элемент ТО
        //отступы  пишем для группы!!!!
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 20)
        //section
            //1 - group
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 30, bottom: 50, trailing: 30)
        
        return section
    }
    
    private func newsSectionLaout() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
            
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(96)) ///!!!!!! не писать absolute

        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
//        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        
        //section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = .init(top: 0, leading: 30, bottom: 50, trailing: 30)
        
        return section
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }


}


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
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.reuseIdentifier, for: indexPath) as! StoryCell
            cell.configCell(for: item)
                return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCell.reuseIdentifier, for: indexPath) as! MessageCell
            cell.setupCell(item: item)
            return cell
        }
    }
        
    
}


class StoryCell: UICollectionViewCell{
    static let reuseIdentifier = "StoryCell"
    
    lazy var cellImage: UIImageView = {
        $0.frame = CGRect(x: 0 , y: 0, width: bounds.width, height: 80)
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var nameLabel: UILabel = {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.frame = CGRect(x: 0, y: cellImage.frame.maxY + 2, width: bounds.width, height: 20)
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .red
        contentView.addSubview(cellImage)
        contentView.addSubview(nameLabel)
    }
    
    
    func configCell(for cell: CollectionItem){
        self.cellImage.image = UIImage(named: cell.image)
        self.nameLabel.text = cell.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//error nil

import UIKit



// Изменение: обновление mockData внутри struct ItemModel для соответствия требованию (текст от 1 до 10 предложений)
struct ItemModel{
    let image: String
    let text: String

    static let mockData: [ItemModel] = [
        // 1 предложение
        ItemModel(image: "img1", text: "Это краткий текст."),
        // 3 предложения
        ItemModel(image: "img2", text: "Это текст с несколькими предложениями. Второе предложение. Третье предложение."),
        // 10 предложений
        ItemModel(image: "img3", text: "Пример текста с большим количеством предложений. Второе предложение. Третье предложение. Четвертое предложение. Пятое предложение. Шестое предложение. Седьмое предложение. Восьмое предложение. Девятое предложение. Десятое предложение."),
    ]
}



class ViewController: UIViewController {

 
    //Надстройка над коллекцией - говорит как ведет себя коллекция
    //и какие размеры у ячеек коллекции
    //    lazy var layout: UICollectionViewFlowLayout = {
    //        $0.scrollDirection = .vertical
    //        $0.minimumInteritemSpacing = 20
    ////        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    //        $0.itemSize = CGSize(width: view.frame.width - 20, height: 200)
    //        $0.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    //        return $0
    //    }(UICollectionViewFlowLayout())

    let mockData = ItemModel.mockData
    
    lazy var collectionView: UICollectionView = {
        
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout 
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        
        $0.dataSource = self
        $0.delegate = self
        $0.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseId)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
   
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout{
   
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.reuseId, for: indexPath) as! PostCell
        cell.configure(item: mockData[indexPath.item])
        return cell
    }
    
}

// MARK: - Protocol

protocol CellProtocol: AnyObject {
    static var reuseId: String { get }
    func configure(item: ItemModel)
    func setContraints()
}


// MARK: - Cell

class PostCell: UICollectionViewCell, CellProtocol{
    
    static var reuseId: String = "PostCell"
    private let cellWidth = UIScreen.main.bounds.width - 60
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(contenText)
        contentView.addSubview(btn)
    }
    
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    lazy var contenText: UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var btn: UIButton = {
        $0.setTitle( "Like", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return $0
    }(UIButton())
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        contenText.text = nil
        
        imageView.constraints.forEach { contr in
            imageView.removeConstraint(contr)
        }
        
     //   print(imageView.constraints.count)
    }
    
    func configure(item: ItemModel) {
        imageView.image = UIImage(named: item.image)
        contenText.text = item.text
        
        setContraints()
    }
    
    func setContraints(){
        
        let imageRatio = imageView.image?.getRatio() ?? 1
        print(imageRatio)
        let imageH = cellWidth * imageRatio
        print(imageH)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: imageH),
            imageView.widthAnchor.constraint(equalToConstant: cellWidth),
            
            
            contenText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            contenText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            contenText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            btn.topAnchor.constraint(equalTo: contenText.bottomAnchor, constant: 10),
            btn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            btn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            btn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImage{
    func getRatio() -> CGFloat{
        return self.size.height/self.size.width
    }
}

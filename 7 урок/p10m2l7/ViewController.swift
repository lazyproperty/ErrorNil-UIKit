//error nil

import UIKit

struct CollectioModel{
    let image: String
    let name: String
    let price: String
    
    static var mockData: [CollectioModel] {
        [
            CollectioModel(image: "img1", name: "МОККА", price: "100"),
            CollectioModel(image: "img2", name: "ЛАТТЕ", price: "200"),
            CollectioModel(image: "img3", name: "КАПУЧИНО", price: "300"),
            CollectioModel(image: "img4", name: "РАФ КЛАССИЧЕСКИЙ", price: "400"),
            CollectioModel(image: "img1", name: "МОККА", price: "100"),
            CollectioModel(image: "img2", name: "ЛАТТЕ", price: "200"),
            CollectioModel(image: "img3", name: "КАПУЧИНО", price: "300"),
            CollectioModel(image: "img4", name: "РАФ КЛАССИЧЕСКИЙ", price: "400"),
            CollectioModel(image: "img1", name: "МОККА", price: "100"),
            CollectioModel(image: "img2", name: "ЛАТТЕ", price: "200"),
            CollectioModel(image: "img3", name: "КАПУЧИНО", price: "300"),
            CollectioModel(image: "img4", name: "РАФ КЛАССИЧЕСКИЙ", price: "400"),
            CollectioModel(image: "img1", name: "МОККА", price: "100"),
            CollectioModel(image: "img2", name: "ЛАТТЕ", price: "200"),
            CollectioModel(image: "img3", name: "КАПУЧИНО", price: "300"),
            CollectioModel(image: "img4", name: "РАФ КЛАССИЧЕСКИЙ", price: "400"),
            CollectioModel(image: "img1", name: "МОККА", price: "100"),
            CollectioModel(image: "img2", name: "ЛАТТЕ", price: "200"),
            CollectioModel(image: "img3", name: "КАПУЧИНО", price: "300"),
            CollectioModel(image: "img4", name: "РАФ КЛАССИЧЕСКИЙ", price: "400"),
        ]
    }
}

class ViewController: UIViewController {

    
    //1 массив данных
    //2 коллекци
    //3 нужно соеденить массив с коллекций
    
    let data = CollectioModel.mockData
    //1 Коллекци
    //ЗАПОМНИТЕ!!! UICollectionViewFLOWLayout
    //UICollectionViewLayout
    
    lazy var layout: UICollectionViewFlowLayout = {
        
        $0.scrollDirection = .vertical
        ///Когда скролл ГОРИЗОНТАЛЬНЫЙ элементы
        ///заполняются по всей ВЫСОТЕ
        ///
        ///Если скролл ВЕРТИКАЛЬНЫЙ то элементы
        ///заполняются по Ширине
        $0.itemSize = CGSize(width: (view.frame.width - 40)/2, height: view.frame.height/3 - 30)
        $0.minimumLineSpacing = 20 //hor
        $0.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return $0
    }(UICollectionViewFlowLayout())
    
    lazy var collectionView: UICollectionView = {
        $0.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
        $0.dataSource = self
        
        $0.backgroundColor = .lightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layout))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }

}


extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseIdentifier, for: indexPath) as! CollectionCell
        
        cell.completion = {
            let vc = SecondVC(item: self.data[indexPath.item])
            self.navigationController?.pushViewController(vc, animated: true)
            //print(indexPath.item)
        }
        
        cell.configure(item: data[indexPath.item])
        return cell
    }
    
    
}


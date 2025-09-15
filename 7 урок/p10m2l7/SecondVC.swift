//error nil

import UIKit

class SecondVC: UIViewController{
    var item: CollectioModel
    
    init(item: CollectioModel) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
        title = item.name
    }
}

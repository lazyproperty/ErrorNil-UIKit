//error nil

import UIKit

class SecondVC: UIViewController {

    //4 Класс который будет Выполлять делегируемую функцию ДОЛЖЕН ПРИНЯТЬ ДЕЛЕГАТ!!!
    var delegate: TabViewDelegate?
    
    private lazy var addBnt: UIButton = {
        $0.frame.size = CGSize(width: 70, height: 70)
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .black
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .white
        $0.frame.origin = CGPoint(x: view.frame.width - 100, y: view.frame.height - 150)
        return $0
    }(UIButton(primaryAction: action))
    
    lazy var action: UIAction = UIAction { _ in
        
        
        //5 ВЫПОЛНИТЬ делегат
        self.delegate?.setTabIndex(index: 2)
        
        
        //НИКОГДА ТАК НЕ ДЕЛАТЬ!!!!!!!!!!!!
//        let vc = TabView()
//        vc.setTabIndex(index: 1)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
        view.addSubview(addBnt)
    }
    


}

//error nil

import UIKit

class SecondVC: UIViewController {

    var name: String = ""
    
    
    private lazy var addBnt2: UIButton = {
        $0.frame.size = CGSize(width: 70, height: 70)
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .black
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .white
        $0.frame.origin = CGPoint(x: 30, y: view.frame.height - 100)
        $0.tag = 1
        return $0
    }(UIButton(primaryAction: action))
    
    
    lazy var action: UIAction = UIAction { [weak self] btn in
        
        guard let sender = btn.sender as? UIButton else { return }
        
        if sender.tag == 1 {
            let vc = SettingVC()
            self?.navigationController?.pushViewController(vc, animated: true)
        } else {
            //НИ В КОЕМ СЛУЧАЕ НЕ ДЕЛАЕМ ТАК!!!!!!!!!
//            let vc = ViewController()
//            self?.navigationController?.pushViewController(vc, animated: true)
            
            self?.navigationController?.popViewController(animated: true)
        }
         
    }
    
    
    private lazy var backBtn: UIButton = {
        $0.frame.size = CGSize(width: 70, height: 70)
        $0.layer.cornerRadius = 30
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .black
        $0.frame.origin = CGPoint(x: 10, y: 40)
        $0.tag = 2
        return $0
    }(UIButton(primaryAction: action))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = name
        
        view.addSubview(addBnt2)
        view.addSubview(backBtn)
        
        
    }
    

}

//error nil

import UIKit

class ViewController: UIViewController {

    
    private lazy var addBtn2: UIButton = {
        $0.frame.size = CGSize(width: 70, height: 70)
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .black
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .white
        $0.frame.origin = CGPoint(x: 30, y: view.frame.height - 100)
        $0.tag = 1
        return $0
    }(UIButton(primaryAction: action))
    
    private lazy var addBtn: UIButton = {
        $0.frame.size = CGSize(width: 70, height: 70)
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .black
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .white
        $0.frame.origin = CGPoint(x: view.frame.width - 100, y: view.frame.height - 100)
        $0.addAction(action, for: .touchUpInside)
        $0.tag = 2
        
        return $0
    }(UIButton())
    
    lazy var action: UIAction = UIAction { [weak self] btn in
        guard let sender = btn.sender as? UIButton else { return }
        if sender.tag == 1 {
           
            //1 объявить контроллер куда идет переход
            let vc = SecondVC()
            vc.name = "Islam"
            //2 перейти на него
            self?.navigationController?.pushViewController(vc, animated: true)
            
        } else {
            let settingVC = SettingVC()
            self?.navigationController?.pushViewController(settingVC, animated: true)
        }
        
    }
    
   
    
    var search = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Main"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .lightGray
        
        //navigationItem.searchController = search
        

        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "chevron.right"),
                style: .plain,
                target: self,
                action: #selector(navTo)),
            
            UIBarButtonItem(
                image: UIImage(systemName: "plus"),
                style: .plain,
                target: self,
                action: #selector(navTo))
            
        ]
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: nil)
        
        
        
        view.addSubview(addBtn)
        view.addSubview(addBtn2)
        
    }

    @objc
    func navTo(){
        let vc = SecondVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


//UINavigationController -> rootController

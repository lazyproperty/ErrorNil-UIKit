//error nil

import UIKit


//tabView
//delegate


//1 protocol

protocol ViewControllerDelegate{
    func setLabelText(text: String)
    func setVCBG()
}

//2 подписать под делегат класс КОТОРЫЙ будет делегировать (передавать!!!)
class ViewController: UIViewController, ViewControllerDelegate {
    
    

    
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
        let profileVC = ProfileVC()
       
        
        //5 передать делегат!!!!
        profileVC.delegate = self
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "USER NAME"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 30)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        view.addSubview(userNameLabel)
        view.addSubview(addBnt)
        
    }

    
    func setLabelText(text: String){
        userNameLabel.text = text
    }
    
    func setVCBG() {
        view.backgroundColor = .red
    }
    
}


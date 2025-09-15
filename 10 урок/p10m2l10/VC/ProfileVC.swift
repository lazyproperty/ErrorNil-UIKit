//error nil

import UIKit

class ProfileVC: UIViewController {

    //3 принять делегат
    var delegate: ViewControllerDelegate?
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 40)
        textField.backgroundColor = . gray
        textField.placeholder = "Name"
        return textField
    }()
    
    
    lazy var btn: UIButton = {
        let btn = UIButton(primaryAction: action)
        btn.frame = CGRect(x: 20, y: 150, width: view.frame.width - 40, height: 50)
        btn.backgroundColor = .black
        btn.setTitle("save", for: .normal)
        return btn
    }()
    
    lazy var action: UIAction = UIAction{ _ in
        let name = self.textField.text ?? ""
        //4 вызвать метод делегата
        self.delegate?.setLabelText(text: name)
        self.delegate?.setVCBG()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(btn)
        
    }
    
}

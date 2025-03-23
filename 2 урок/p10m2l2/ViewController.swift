//error nil

import UIKit

//UIImageView
//UITextField+
//UItextView
//minX/maxX+
//minY/maxY+

class ViewController: UIViewController {

    lazy var screenWith = view.frame.width
   
    lazy var textField = createTextField(offsetY: 79, placeholder: "login")
    lazy var passwordField = createTextField(offsetY: textField.frame.maxY + 15, placeholder: "password", isPassword: true)
    lazy var emailField = createTextField(offsetY: passwordField.frame.maxY + 35, placeholder: "email")
    lazy var descripField = createTextField(offsetY: emailField.frame.maxY + 15, placeholder: "description", offsetLeft: 5)
    
    lazy var button: UIButton = {
        let btn = UIButton()
        //btn.setTitle("Save", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.frame.size = CGSize(width: screenWith - 60, height: 55)
        btn.frame.origin = CGPoint(x: 30, y: view.frame.maxY - 92)
        btn.layer.cornerRadius = 10
        
        btn.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    lazy var textView: UITextView = {
        $0.backgroundColor = .appGray
        $0.frame.origin = CGPoint(x: 30, y: descripField.frame.maxY + 30)
        $0.frame.size = CGSize(width: screenWith - 60, height: 150)
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 16)
        return $0
    }(UITextView())
    
    
    lazy var imgeView: UIImageView = {
        $0.frame.size = CGSize(width: screenWith - 60, height: 150)
        $0.frame.origin = CGPoint(x: 30, y: textView.frame.maxY + 15)
        $0.backgroundColor = .systemGray6
        $0.image = .profImg
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(textField,passwordField,emailField,descripField,button, textView, imgeView)
        
        

    }
    
    
    private func createTextField(offsetY: CGFloat, placeholder: String, isPassword: Bool = false, offsetLeft: Int = 10) -> UITextField{
        let textField = UITextField()
        
        textField.frame.size = CGSize(width: screenWith - 60, height: 52)
        textField.frame.origin = CGPoint(x: 30, y: offsetY)
        textField.backgroundColor = .appGray
        textField.placeholder = placeholder
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = isPassword
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: offsetLeft, height: 0))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.rightViewMode = .always
        return textField
    }
    
}

///1 взять ширину экрана view




extension UIView{
    func addSubviews(_ subviews: UIView...){
        subviews.forEach{addSubview($0)}
    }
}

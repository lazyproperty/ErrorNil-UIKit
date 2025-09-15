//error nil

import UIKit // подключае UIKIT


final class ViewController: UIViewController { // UIViewController - страница приложения

    let userName: UILabel = UILabel()
    let rectancle: UIView = UIView()
    let btn: UIButton = UIButton()
    
    lazy var action: UIAction = UIAction { _ in
        self.userName.text = "Hello, world!"
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //view - холст на который мы можем накидывать элементы
        
        
        rectancle.frame.size = CGSize(width: 300, height: 70) // CGSize - размеры
        rectancle.frame.origin = CGPoint(x: 25, y: 91) //CGPoint - позиция
        rectancle.backgroundColor = .black
        
        
        let circle: UIView = UIView(frame: CGRect(x: 38, y: 186, width: 70, height: 70))
        circle.backgroundColor = .red
        circle.layer.cornerRadius = 35
        
        
        
        
        btn.frame = CGRect(x: 25, y: 286, width: 200, height: 50)
        btn.backgroundColor = .blue
        btn.setTitle("simple button", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addAction(action, for: .touchUpInside)
        
        
       
        userName.frame = CGRect(x: 25, y: 356, width: 200, height: 150) //CGRect = CGSize + CGPoint
        userName.text = "My name is Islam skjfnkjs ndfjknas jkfbsdjkfb asjknbdfjsab jfbasjd basjknd jkasndjka nsd"
        userName.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        userName.textColor = .brown
        userName.numberOfLines = 0
        
        
        view.addSubview(rectancle)
        view.addSubview(circle)
        view.addSubview(btn)
        view.addSubview(userName)
        
        
        
    
        //frame - size/ position
        //backgroundColor
    }

    

//    private func setupButton(){
//        print("viewDidLoad")
//    }
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        print("viewWillAppear")
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        print("viewDidAppear")
//        print("reload")
//        
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        print("viewWillDisappear")
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        print("viewDidDisappear")
//    }
//    
//    override func viewWillLayoutSubviews() {
//        print("viewWillLayoutSubviews")
//    }
//    
//    override func viewDidLayoutSubviews() {
//        print("viewDidLayoutSubviews")
//    }
//    
    
    
}


//Жизненный цикл UIViewController


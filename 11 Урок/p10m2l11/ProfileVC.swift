//error nil

import UIKit

class ProfileVC: UIViewController {

    let images: [UIImage] = [.rectangle41, .rectangle42]
    
    
    lazy var stackView: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .bottom
        $0.distribution = .fill
        $0.backgroundColor = .lightGray
        $0.spacing = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    
    
    lazy var btn: PinkButton = {
        $0.setTitle("Сохранить", for: .normal)
        return $0
    }(PinkButton(action: action))
    
    lazy var action = UIAction { _ in
        self.present(ProfileVC(), animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn)
        view.addSubview(stackView)
        
        images.forEach { img in
            let imageView = SomeImage(image: img)
            stackView.addArrangedSubview(imageView)
        }
        
        NSLayoutConstraint.activate([
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btn.heightAnchor.constraint(equalToConstant: 50),
            btn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            stackView.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 120)
            
        ])
    }
}

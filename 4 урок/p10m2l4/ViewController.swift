//error nil

import UIKit

class ViewController: UIViewController {

    lazy var bannerView: UIView = {
        $0.backgroundColor = .red
        //ВАЖНО TAMIC = false
        // констрейнты главнее фреймов
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    lazy var nameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "lorem ipsum dolor sit amet consectetur adipisicing lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!   lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!  lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!  lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!   elit. Quo, voluptatem! Quasi, voluptates!"
        $0.numberOfLines = 0
        $0.textColor = .white
        return $0
    }(UILabel())
    
    lazy var userText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "lorem ipsum dolor sit amet consectetur adipisicing lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!"
        $0.numberOfLines = 0
        $0.textColor = .black
        
        return $0
    }(UILabel())
    
    lazy var someView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        return $0
    }(UIView())
    
    
    lazy var otherView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .green
        return $0
    }(UIView())
    
    lazy var brownView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .brown
        return $0
    }(UIView())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bannerView)
        view.addSubview(someView)
        view.addSubview(otherView)
        view.addSubview(brownView)
        
        
        
        bannerView.addSubview(nameLabel)
        bannerView.addSubview(userText)
        
        //1 вариант
        // leading - лево
        // trailing - право
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        
        
        NSLayoutConstraint.activate([
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bannerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            
            nameLabel.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: bannerView.topAnchor, constant: 5),
            
            userText.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 10),
            userText.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -10),
            userText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            userText.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: -10),
            
            
            someView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            someView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 20),
            someView.heightAnchor.constraint(equalToConstant: 100),
            someView.widthAnchor.constraint(equalToConstant: 100),
            
            otherView.topAnchor.constraint(equalTo: someView.topAnchor),
            otherView.leadingAnchor.constraint(equalTo: someView.trailingAnchor, constant: 20),
            otherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            otherView.heightAnchor.constraint(equalTo: someView.heightAnchor, multiplier: 1),
            
            brownView.heightAnchor.constraint(equalToConstant: 100),
            brownView.widthAnchor.constraint(equalToConstant: 100),
           
            brownView.centerXAnchor.constraint(equalTo: bannerView.centerXAnchor),
            brownView.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor, constant: -100)
            
        ])
    }


}


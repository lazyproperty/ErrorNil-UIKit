//error nil

import UIKit



//1 Если у класса A() есть функция КОТОРАЯ должна
// выполняться в классе B() ее выносим в протокол
protocol TabViewDelegate{
    func setTabIndex(index: Int)
}

//2 Класс КОТОРЫЙ ДЕЛЕГИРУЕТ функцию ДОЛЖЕН подписаться под созданный протокол
//3 Класс КОТОРЫЙ ДЕЛЕГИРУЕТ функцию должен реализовать протокол



class TabView: UITabBarController, TabViewDelegate {

    
    lazy var tbView: UIView = {
        $0.backgroundColor = .red
        $0.frame = CGRect(x: 0, y: view.frame.height - 80, width: view.frame.width, height: 80)
        $0.addSubview(seconVcBnt)
        return $0
    }(UIView())
    
    
    
    lazy var seconVcBnt: UIButton = {
        $0.frame.size = CGSize(width: 50, height: 50)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .white
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.frame.origin.x = (view.frame.width - 50) / 2
        $0.frame.origin.y = -25
        return $0
    }(UIButton(primaryAction: UIAction(handler: { _ in
        self.selectedIndex = 1
    })))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let mainVc = UINavigationController(rootViewController: ViewController())
        let secondVC = SecondVC()
        let thirdVC = ThirdVC()
        
        setViewControllers([mainVc, secondVC, thirdVC], animated: false)
        tabBar.isHidden = true
        
        
        view.addSubview(tbView)
    }
    
    private func setupTabBar(){
        let mainVc = UINavigationController(rootViewController: ViewController()) 
        mainVc.tabBarItem.title = "Main"
        mainVc.tabBarItem.image = UIImage(systemName: "house")
        mainVc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        
        //5 ПЕРЕДАТЬ делегат!!!!!
        let secondVC = SecondVC()
        secondVC.delegate = self
        
        secondVC.tabBarItem.title = "Second"
        secondVC.tabBarItem.image = UIImage(systemName: "square.and.arrow.up")
        secondVC.tabBarItem.selectedImage = UIImage(systemName: "heart")
        secondVC.tabBarItem.badgeValue = "10+"
        
        
        let thirdVC = ThirdVC()
        thirdVC.tabBarItem.title = "Third"
        thirdVC.tabBarItem.image = UIImage(systemName: "square.and.arrow.down")
        
        setViewControllers([mainVc, secondVC, thirdVC], animated: false)
        
        
        
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
    }
    
    
    //MARK: Делигировать ЭТУ функцию в SecondVC
    func setTabIndex(index: Int) {
        selectedIndex = index
        ///
    }

}

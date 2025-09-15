//error nil

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        //1 объявить сцену
        guard let scene = (scene as? UIWindowScene) else { return }
        
        //2 Объявить
        self.window = UIWindow(windowScene: scene)
        //3 rootController
        self.window?.rootViewController = UINavigationController(rootViewController: ViewController())  //ViewController()
        //4 включить
        self.window?.makeKeyAndVisible()
        
    }

}


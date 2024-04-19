 
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    static var shared: SceneDelegate?
    
    var myScene : UIScene!
     
    var window: UIWindow?


    func loginCheckOrRestart() {
       
        guard let windowScene = (myScene as? UIWindowScene) else { return }
        
        SceneDelegate.shared = self
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let isLoggedIn = UserDefaultsManager.shared.isLoggedIn()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if isLoggedIn {
         
            let splitVC = storyboard.instantiateViewController(withIdentifier: "SplitViewController") as! UISplitViewController
            window!.rootViewController = splitVC

        } else {

            let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginNavigation")
            window!.rootViewController = loginVC
        }
        
        window?.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        SceneDelegate.shared = self
        self.myScene = scene

    }

}


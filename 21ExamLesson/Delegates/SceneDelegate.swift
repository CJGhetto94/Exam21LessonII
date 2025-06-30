import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let cartoonManager = CartoonManager()
        let cartoonDataManager = CartoonDataManager()
        let viewController = ViewController()
        let cartoons = cartoonManager.getCartoon().sorted(by: <)
        
        cartoonDataManager.addCartoon(cartoon: cartoons)
        viewController.cartoonDataManager = cartoonDataManager
        printSortedArray()
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        
        func printSortedArray() {
            for descript in cartoonManager.getCartoon() {
                print(descript.description)
            }
        }
    }
}

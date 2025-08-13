import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let viewController = ImageListViewController()
        
        let cartoonManager = CartoonManager()
        let cartoonDataManager = CartoonDataManager()
        
        let cartoons = cartoonManager.getCartoon().sorted(by: <)
        
        cartoonDataManager.addCartoon(cartoon: cartoons)
        viewController.cartoonDataManager = buildCartoonManager()
        printSortedArray(cartoonManager)
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    func printSortedArray(_ service: CartoonManager) {
        for descript in service.getCartoon() {
            print(descript.description)
        }
    }
    
}
//MARK: - Setting SceneDelegate
extension SceneDelegate {
    func buildCartoonManager() -> CartoonDataProcessing {
        let cartoonManager: ICartoonManager = CartoonManager()
        let cartoonDataManger = CartoonDataManager()
        cartoonDataManger.addCartoon(cartoon: cartoonManager.getCartoon())
        return cartoonDataManger
    }
}

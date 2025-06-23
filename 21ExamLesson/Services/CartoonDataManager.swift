import UIKit

final class CartoonDataManager {
    private var cartoons: [CartoonModel] = []
    private var currentIndex = 0
    
    func addCartoon(cartoon: [CartoonModel]) {
        self.cartoons.append(contentsOf: cartoon)
    }
    
    func getCurrentCartoon() -> CartoonModel {
        cartoons[currentIndex]
    }
    
    func getCurrentCartoonNext() -> CartoonModel {
        if currentIndex >= 0 && currentIndex < cartoons.count - 1 {
            currentIndex += 1
        }
        return getCurrentCartoon()
    }
    
    func getCurrentCartoonLast() -> CartoonModel {
        if currentIndex > 0 && currentIndex <= cartoons.count {
            currentIndex -= 1
        }
        return getCurrentCartoon()
    }
    
    func getFirstCartoon() -> CartoonModel {
        currentIndex = 0
        return getCurrentCartoon()
    }
}

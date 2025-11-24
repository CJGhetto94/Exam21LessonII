import UIKit

final class CartoonDataManager: CartoonDataProcessing {
    func toogle(product: CartoonModel) {
        if let index = cartoons.firstIndex(of: product) {
            cartoons[index].editFlag.toggle()
        }
    }
    
    
    private var cartoons: [CartoonModel] = []
    private var currentIndex = 0
    
    func getCartoon() -> [CartoonModel] {
        cartoons
    }
    
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
    
    func findImage(_ inputName: String) -> CartoonModel? {
        
        for nameImage in cartoons {
            if nameImage.imageName == inputName {
                return nameImage
            }
        }
        return nil
    }
    
    func removeCartoon(index: Int) {
        cartoons.remove(at: index)
    }
    
    func editFlagCartoon(index: Int) {
        var cartoon = cartoons[index]
        
        cartoon.editFlag.toggle()
        cartoons[index] = cartoon
        
    }
    
    func getEditFlagCartoon() -> [CartoonModel] {
        var isEditFlagCartoon = [CartoonModel]()
        for cartoon in cartoons {
            if cartoon.editFlag {
                isEditFlagCartoon.append(cartoon)
            }
        }
        return isEditFlagCartoon
    }
}
//MARK: - CartoonDataProccesing protocol
protocol CartoonDataProcessing {
    
    func addCartoon(cartoon: [CartoonModel])
    func getCurrentCartoon() -> CartoonModel
    func getCurrentCartoonNext() -> CartoonModel
    func getCurrentCartoonLast() -> CartoonModel
    func getFirstCartoon() -> CartoonModel
    func findImage(_ inputName: String) -> CartoonModel?
    func removeCartoon(index: Int)
    func getCartoon() -> [CartoonModel]
    func editFlagCartoon(index: Int)
    func toogle(product: CartoonModel)
    func getEditFlagCartoon() -> [CartoonModel]
}

import UIKit

final class CartoonManager: ICartoonManager {
    
    func getCartoon() -> [CartoonModel] {
        [
            CartoonModel(imageName: "berserk", cartoonName: "Berserk"),
            CartoonModel(imageName: "catDog", cartoonName: "Cat Dog"),
            CartoonModel(imageName: "futurama", cartoonName: "Futurama"),
            CartoonModel(imageName: "simspons", cartoonName: "Simpsons"),
            CartoonModel(imageName: "wind", cartoonName: "Spirited Away"),
            CartoonModel(imageName: "southPark", cartoonName: "South Park"),
            CartoonModel(imageName: "sponge", cartoonName: "Sponge Bob"),
            CartoonModel(imageName: "tornBerry", cartoonName: "The Wild Thornberry"),
            CartoonModel(imageName: "melancholia", cartoonName: "Melancholia Haruhi Suzumiya"),
            CartoonModel(imageName: "cars", cartoonName: "Cars")
        ]
    }
    private var cartoonGet = [CartoonModel]()
    
    func getCartoonArray() -> [CartoonModel] {
        cartoonGet
    }
    func removeCartoonArray(index: Int) {
        cartoonGet.remove(at: index)
    }
    func editFlag(index: Int) {
        
    }
}

protocol ICartoonManager {
    func getCartoon() -> [CartoonModel]
    func getCartoonArray() -> [CartoonModel]
    func removeCartoonArray(index: Int)
}

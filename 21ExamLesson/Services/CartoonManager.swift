import UIKit

final class CartoonManager: ICartoonManager {
    
    func getCartoon() -> [CartoonModel] {
        [
            CartoonModel(imageName: "berserk", cartoonName: "Berserk", editFlag: false),
            CartoonModel(imageName: "catDog", cartoonName: "Cat Dog", editFlag: false),
            CartoonModel(imageName: "futurama", cartoonName: "Futurama", editFlag: false),
            CartoonModel(imageName: "simspons", cartoonName: "Simpsons", editFlag: false),
            CartoonModel(imageName: "wind", cartoonName: "Spirited Away", editFlag: false),
            CartoonModel(imageName: "southPark", cartoonName: "South Park", editFlag: false),
            CartoonModel(imageName: "sponge", cartoonName: "Sponge Bob", editFlag: false),
            CartoonModel(imageName: "tornBerry", cartoonName: "The Wild Thornberry", editFlag: false),
            CartoonModel(imageName: "melancholia", cartoonName: "Melancholia Haruhi Suzumiya", editFlag: false),
            CartoonModel(imageName: "cars", cartoonName: "Cars", editFlag: false)
        ]
    }
    
}

protocol ICartoonManager {
    func getCartoon() -> [CartoonModel]
}

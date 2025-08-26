import UIKit

final class CartoonManager: ICartoonManager {
    
    func getCartoon() -> [CartoonModel] {
        [
            CartoonModel(imageName: "berserk", cartoonName: "Berserk", editFlag: true, descriptionCartoon: "Создатель аниме умер до завершения истории"),
            CartoonModel(imageName: "catDog", cartoonName: "Cat Dog", editFlag: false, descriptionCartoon: "Мультфильм шел по ТНТ"),
            CartoonModel(imageName: "futurama", cartoonName: "Futurama", editFlag: false, descriptionCartoon: "Очень много серий"),
            CartoonModel(imageName: "simspons", cartoonName: "Simpsons", editFlag: false,descriptionCartoon: "Идет до сих пор"),
            CartoonModel(imageName: "wind", cartoonName: "Spirited Away", editFlag: false, descriptionCartoon: "Аниме Хаяо Миядзаки"),
            CartoonModel(imageName: "southPark", cartoonName: "South Park", editFlag: false, descriptionCartoon: "Не детский мультсериал"),
            CartoonModel(imageName: "sponge", cartoonName: "Sponge Bob", editFlag: false, descriptionCartoon: "История про Губки на дне океана"),
            CartoonModel(imageName: "tornBerry", cartoonName: "The Wild Thornberry", editFlag: true, descriptionCartoon: "Мультфильм про семью путешественников"),
            CartoonModel(imageName: "melancholia", cartoonName: "Melancholia Haruhi Suzumiya", editFlag: false, descriptionCartoon: "Аниме у которого нет конца истории"),
            CartoonModel(imageName: "cars", cartoonName: "Cars", editFlag: true, descriptionCartoon: "Мультфильм про одушевленные автомобили")
        ]
    }
}

protocol ICartoonManager {
    func getCartoon() -> [CartoonModel]
}

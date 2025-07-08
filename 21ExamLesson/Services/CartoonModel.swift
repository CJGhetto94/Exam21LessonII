import UIKit

struct CartoonModel {
    let imageName: String
    let cartoonName: String
}


//MARK: - Comporable
extension CartoonModel: Comparable {
    static func < (lhs: CartoonModel, rhs: CartoonModel) -> Bool {
        lhs.imageName < rhs.imageName
    }
}
//MARK: - CustomStringConvertible
extension CartoonModel: CustomStringConvertible {
    var description: String {
        "Название картинки: \(imageName), описание: \(cartoonName)"
    }
}

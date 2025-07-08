import UIKit

//MARK: - Methods for UIView
extension UIView {
    func setViewOfUIButton(_ views: UIView...) -> Int {
        var numOfView = 0
        
        for view in views {
            if view is CustomButton {
                numOfView += 1
            }
        }
        return numOfView
    }
    
    func setViewElements(_ views: UIView...) {
        for view in views {
            if let name = view as? CustomButton {
                print(name.nameOfElement ?? "Unowned name")
            } else if let name = view as? ImageView {
                print(name.nameOfElement ?? "Unowed name")
            }
        }
    }
    
}

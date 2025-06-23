import UIKit

//MARK: - Add View on Superview
extension UIView {
    
    func addSomeView(_ customView: UIView...) {
        
        for addView in customView {
            addSubview(addView)
        }
    }
}

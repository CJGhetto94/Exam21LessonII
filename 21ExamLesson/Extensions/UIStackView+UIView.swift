import UIKit

//MARK: - Add Stack on View
extension UIStackView {
    
    func addSomeStackView(_ customStack: UIView...) {
        
        for addStackView in customStack {
            addArrangedSubview(addStackView)
        }
    }
}

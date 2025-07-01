import UIKit

final class CustomButton: UIButton {
    
    var delegate: ICustomButtonDelegate?
    
    init(textButton: String, bgColor: UIColor, setTitleColor: UIColor) {
        super.init(frame: .zero)
        setupButton(text: textButton, bgColor: bgColor, titleColor: setTitleColor)
        addAction()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(rect: bounds)
        layer.shadowPath = shadowPath.cgPath
    }
}
//MARK: - Setup Button
private extension CustomButton {
    func setupButton(text: String, bgColor: UIColor, titleColor: UIColor) {
        layer.frame = CGRect(x: 0, y: 0, width: 70, height: 50)
        setTitle(text, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = Constant.cornerRadius
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10
    }
}

//MARK: - Constant button
enum Constant {
    static let cornerRadius: CGFloat = 10
}

//MARK: - Action Button
extension CustomButton {
    
    private func addAction() {
        
        let action = UIAction { _ in
            self.delegate?.actionButton(self)
        }
        addAction(
            action,
            for: .touchUpInside
        )
    }
}
//MARK: - IButtonPushed
protocol ICustomButtonDelegate {
    func actionButton(_ button: UIButton)
}

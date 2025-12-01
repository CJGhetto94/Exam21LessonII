//  Created by mac on 27.11.2025.
//
import UIKit

final class CustomView: UIView {
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let imageCartoon = UIImageView()
    private let checkMackButton = UIButton()
    
    private var toogleCheckMark = false
    
    var action: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(cartoon: CartoonModel) {
        titleLabel.text = cartoon.cartoonName
        descriptionLabel.text = cartoon.descriptionCartoon
        imageCartoon.image = UIImage(named: cartoon.imageName)
        toogleCheckMark = cartoon.editFlag
        
        
        let checkMark = toogleCheckMark ? "checkmark.square.fill" : "checkmark.square"
        checkMackButton.setImage(UIImage(systemName: checkMark), for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = UIColor(
                cgColor: CGColor(red: 210/255, green: 225/255, blue: 230/255, alpha: 0.5))
            self.layer.shadowOffset = CGSize(width: 2, height: 2)
        } completion: { _ in
            self.backgroundColor = UIColor(
                cgColor: CGColor(red: 2255/255, green: 220/255, blue: 200/255, alpha: 1))
            self.layer.shadowOffset = CGSize(width: 5, height: 5)
        }
    }
}
//MARK: - Setting
private extension CustomView {
    func setup() {
        addSubView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupImageCartoon()
        setupCheckMarkButton()
        setupViewCell()
        
        setupLayout()
    }
    
    func addSubView() {
        [titleLabel, descriptionLabel, imageCartoon, checkMackButton].forEach { view in
            addSubview(view)
        }
    }
}
//MARK: - Setting Views
private extension CustomView {
    func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
    }
    
    func setupImageCartoon() {
        imageCartoon.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageCartoon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageCartoon.contentMode = .scaleAspectFit
    }
    
    func setupCheckMarkButton() {
        checkMackButton.tintColor = .blue
        let action = UIAction { _ in
            self.toogleCheckMark.toggle()
            let checkMark = self.toogleCheckMark ? "checkmark.square.fill" : "checkmark.square"
            self.checkMackButton.setImage(UIImage(systemName: checkMark), for: .normal)
            self.action?()
        }
        
        checkMackButton.addAction(action, for: .touchUpInside)
    }
    func setupViewCell() {
        layer.cornerRadius = 20
        backgroundColor = UIColor(
            cgColor: CGColor(red: 210/255, green: 200/255, blue: 255/255, alpha: 255/255))
    }
}
//MARK: - Setup Layout
private extension CustomView {
    func setupLayout() {
        [titleLabel, descriptionLabel, imageCartoon, checkMackButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let contraint = checkMackButton.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -16
        )
        contraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            imageCartoon.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            imageCartoon.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16
            ),
            
            
            titleLabel.leadingAnchor.constraint(
                equalTo: imageCartoon.trailingAnchor,
                constant: 16
            ),
            titleLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16
            ),
            titleLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: checkMackButton.leadingAnchor,
                constant: -8
            ),
            
            
            descriptionLabel.leadingAnchor.constraint(
                equalTo: titleLabel.leadingAnchor
            ),
            descriptionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 4
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
            
            
            checkMackButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            checkMackButton.centerYAnchor.constraint(
                equalTo: titleLabel.centerYAnchor
            ),
            checkMackButton.widthAnchor.constraint(
                equalToConstant: 30
            ),
            checkMackButton.heightAnchor.constraint(
                equalToConstant: 30
            ),
            contraint
        ])
    }
}

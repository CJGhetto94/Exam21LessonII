import UIKit

final class CartoonCell: UITableViewCell {
    
    var actionButton: ((CartoonCell) -> ())?
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let imageCartoon = UIImageView()
    private let checkMackButton = UIButton()
    
    private var toogleCheckMark = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        selectionStyle = .none
    }
}
//MARK: - Setting
private extension CartoonCell {
    func setup() {
        addSubView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupImageCartoon()
        setupCheckMarkButton()
        setupLayout()
    }
    
    func addSubView() {
        [titleLabel, descriptionLabel, imageCartoon, checkMackButton].forEach { view in
            contentView.addSubview(view)
        }
    }
}
//MARK: - Setting Views
private extension CartoonCell {
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
            let cell = CartoonCell()
            self.actionButton?(cell)
        }
        
        checkMackButton.addAction(action, for: .touchUpInside)
    }
}
//MARK: - Setup Layout
private extension CartoonCell {
    func setupLayout() {
        [titleLabel, descriptionLabel, imageCartoon, checkMackButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageCartoon.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            imageCartoon.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 16
            ),
            
            
            titleLabel.leadingAnchor.constraint(
                equalTo: imageCartoon.trailingAnchor,
                constant: 16
            ),
            titleLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
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
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -16
            ),
            
            
            checkMackButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
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
            )
        ])
    }
}




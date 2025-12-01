import UIKit

final class CartoonCell: UITableViewCell {
    
    private let customView = CustomView()
    
    private var toogleCheckMark = false
    
    var action: ((UITableViewCell) -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(cartoon: CartoonModel) {
        customView.configure(cartoon: cartoon)
        customView.action = toogleCheckMarkButton
        toogleCheckMark = cartoon.editFlag
    }
}
//MARK: - Setting
private extension CartoonCell {
    func setup() {
        contentView.addSubview(customView)
        setupLayout()
    }
    func toogleCheckMarkButton() {
        action?(self)
    }
}

//MARK: - Setup Layout
private extension CartoonCell {
    func setupLayout() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}

import UIKit

final class ImageView: UIImageView {
    
    var nameOfElement: String?
    
    init(imageName: String) {
        super.init(frame: .zero)
        
        setupImageView(imageName)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView(_ imageName: String) {
        image = UIImage(named: imageName)
        layer.cornerRadius = 20
        clipsToBounds = true
        contentMode = .scaleAspectFit
        
    }
    
    func updateImageView(_ imageName: String) {
        image = UIImage(named: imageName)
    }
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor),
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}



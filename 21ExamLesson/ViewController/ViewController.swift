import UIKit

final class ViewController: UIViewController {
    
    private var textLabel = UILabel()
    
    private let lastButton = CustomButton(
        textButton: "Last",
        bgColor: .systemTeal,
        setTitleColor: .white
    )
    private let nextButton = CustomButton(
        textButton: "Next",
        bgColor: .white,
        setTitleColor: .black
    )
    private let firstButton = CustomButton(
        textButton: "First",
        bgColor: .red,
        setTitleColor: .white
    )
    
    private var imageView = ImageView(imageName: "berserk")
    
    var cartoonDataManager: CartoonDataProcessing?
    
    private let imageLabelStack = UIStackView()
    private let twoButtonStack = UIStackView()
    
    private var item: CartoonModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [lastButton, nextButton, firstButton].forEach { button in
            button.delegate = self
        }
        
        setupStackVertical()
        setupStackHorizontal()
        setupLabel()
        
        view.addSomeView(
            imageLabelStack,
            twoButtonStack,
            firstButton
        )
        
        view.backgroundColor = .white
        setupLayout()
        
        item = cartoonDataManager?.getCurrentCartoon()
        updateUI()
    }
    
    //MARK: - Setup Label
    private func setupLabel() {
        textLabel.textColor = .black
        textLabel.font = .systemFont(ofSize: 20)
        textLabel.textAlignment = .center
    }
    //MARK: - Udpate UI
    private func updateUI() {
        imageView.updateImageView(item.imageName)
        textLabel.text = item.cartoonName
    }
}

//MARK: - Setup Stack
private extension ViewController {
    func setupStackHorizontal() {
        twoButtonStack.axis = .horizontal
        twoButtonStack.distribution = .fillEqually
        twoButtonStack.alignment = .fill
        twoButtonStack.spacing = 100
        
        twoButtonStack.addSomeStackView(
            lastButton,
            nextButton
        )
    }
    func setupStackVertical() {
        imageLabelStack.axis = .vertical
        imageLabelStack.distribution = .fillEqually
        imageLabelStack.alignment = .center
        imageLabelStack.spacing = 15
        
        imageLabelStack.addSomeStackView(
            imageView,
            textLabel
        )
    }
}
//MARK: - Setup Layout
private extension ViewController {
    func setupLayout() {
        
        [imageLabelStack,twoButtonStack,firstButton,lastButton].forEach{view in
            view.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            
            imageLabelStack.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 100
            ),
            imageLabelStack.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            imageLabelStack.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.8
            ),
            imageLabelStack.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.4
            ),
            
            twoButtonStack.topAnchor.constraint(
                equalTo: imageLabelStack.bottomAnchor,
                constant: 150
            ),
            twoButtonStack.centerXAnchor.constraint(
                equalTo: imageLabelStack.centerXAnchor
            ),
            twoButtonStack.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.8
            ),
            
            firstButton.bottomAnchor.constraint(
                equalTo: twoButtonStack.bottomAnchor,
                constant: 150
            ),
            firstButton.centerXAnchor.constraint(
                equalTo: twoButtonStack.centerXAnchor
            ),
            firstButton.widthAnchor.constraint(
                equalTo: twoButtonStack.widthAnchor,
                multiplier: 0.5
            )
        ])
    }
}
//MARK: - ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
    func actionButton(_ button: UIButton) {
        if button == nextButton {
            self.item = self.cartoonDataManager?.getCurrentCartoonNext()
            self.updateUI()
        } else if button == lastButton {
            self.item = self.cartoonDataManager?.getCurrentCartoonLast()
            self.updateUI()
        } else {
            self.item = self.cartoonDataManager?.getFirstCartoon()
            self.updateUI()
        }
    }
}

import UIKit

final class ViewController: UIViewController {
    
    private let textLabel = UILabel()
    private let textLabelHide = UILabel()
    
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
        print("Hello world")
        
        nextButton.nameOfElement = "Next Button"
        firstButton.nameOfElement = "First Button"
        lastButton.nameOfElement = "Last Button"
        imageView.nameOfElement = "The Picture"
        
        print(view.setViewOfUIButton(nextButton, firstButton,lastButton))
        view.setViewElements(nextButton, firstButton, lastButton, imageView)
        
        
        [lastButton, nextButton, firstButton].forEach { button in
            button.delegate = self
        }
        
        setupStackVertical()
        setupStackHorizontal()
        setupLabel()
        setupLabelHide()
        
        
        view.addSomeView(
            imageLabelStack,
            twoButtonStack,
            firstButton,
            textLabelHide
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
    private func setupLabelHide() {
        textLabelHide.text = "Будущий текст"
        textLabelHide.textColor = .black
        textLabelHide.font = .systemFont(ofSize: 20)
        textLabelHide.textAlignment = .center
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
        
        [imageLabelStack,twoButtonStack,firstButton,lastButton, textLabelHide].forEach{view in
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
            ),
            
            textLabelHide.topAnchor.constraint(
                equalTo: imageLabelStack.bottomAnchor, constant: 5
            ),
            textLabelHide.centerXAnchor.constraint(
                equalTo: imageLabelStack.centerXAnchor
            ),
            textLabelHide.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.8
            ),
            textLabelHide.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.1
            )
        ])
    }
}
//MARK: - ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
    func actionButton(_ button: UIButton) {
        if button == nextButton {
            item = cartoonDataManager?.getCurrentCartoonNext()
        } else if button == lastButton {
            item = cartoonDataManager?.getCurrentCartoonLast()
        } else {
            item = cartoonDataManager?.getFirstCartoon()
        }
        updateUI()
    }
}
//MARK: - Override touchesBegan
extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textLabelHide.text = item.cartoonName
    }
}


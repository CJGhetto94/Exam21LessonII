
//
//  Created by mac on 23.07.2025.
//
import UIKit


class FindImageViewController: UIViewController {
    
    private var imageView = ImageView(imageName: "")
    
    
    private let textLabel = UILabel()
    private let textLabelFindImage = UILabel()
    
    private let textFieldInput = UITextField()
    
    private let labelTextFieldButtonStack = UIStackView()
    private let imageLabelStack = UIStackView()
    
    private let buttonInput = CustomButton(
        textButton: "Проверить",
        bgColor: .white,
        setTitleColor: .blue
    )
    
    var delegate: ICustomButtonDelegate?
    
    var cartoonDataManager: CartoonDataProcessing?
    private var item: CartoonModel!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonInput.delegate = self
        textFieldInput.delegate = self
    
        view.addSomeView(
            textLabel,
            textFieldInput,
            buttonInput,
            labelTextFieldButtonStack,
            imageLabelStack
        )
        
        setupInterface()
        setupLayout()
    
    }
}
//MARK: - Setup Interface View
private extension FindImageViewController {
    func setupInterface() {
        setupStackView()
        setupImageLabelStack()
        setupLabelFindImage()
        setupLabel()
        setupTextField()
        setupButton()
        
        view.backgroundColor = .white
    }
    
    func setupLabel() {
        textLabel.text = "Введите название картинки"
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.font = UIFont.systemFont(ofSize: 15)
    }
    func setupLabelFindImage() {
        textLabelFindImage.text = " "
        textLabelFindImage.textColor = .black
        textLabelFindImage.textAlignment = .center
        textLabelFindImage.font = UIFont.systemFont(ofSize: 15)
    }
    
    func setupTextField() {
        textFieldInput.placeholder = "Название картинки"
        textFieldInput.borderStyle = .roundedRect
    }
    
    func setupButton() {
        buttonInput.setTitle("Проверить", for: .normal)
        buttonInput.setTitleColor(.blue, for: .normal)
        buttonInput.backgroundColor = .white
    }
    
    func setupStackView() {
        labelTextFieldButtonStack.axis = .vertical
        labelTextFieldButtonStack.distribution = .fillProportionally
        labelTextFieldButtonStack.alignment = .center
        labelTextFieldButtonStack.spacing = 15
        
        labelTextFieldButtonStack.addSomeStackView(
            textLabel,
            textFieldInput,
            buttonInput
        )
    }
    
    func setupImageLabelStack() {
        imageLabelStack.axis = .vertical
        imageLabelStack.distribution = .fillProportionally
        imageLabelStack.alignment = .center
        imageLabelStack.spacing = 15
        
        imageLabelStack.addSomeStackView(
            imageView,
            textLabelFindImage
        )
    }
}
//MARK: - Setup Layout
private extension FindImageViewController {
    
    func setupLayout() {
        
        [textLabel, textFieldInput, buttonInput, labelTextFieldButtonStack, imageView, textLabelFindImage, imageLabelStack].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            labelTextFieldButtonStack.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 50
            ),
            labelTextFieldButtonStack.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            labelTextFieldButtonStack.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.3
            ),
            labelTextFieldButtonStack.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.9
            ),
            
            textLabel.heightAnchor.constraint(
                equalToConstant: 70)
            ,
            textLabel.widthAnchor.constraint(
                equalTo: labelTextFieldButtonStack.widthAnchor,
                multiplier: 0.9
            ),
            
            textFieldInput.heightAnchor.constraint(
                equalToConstant: 30
            ),
            textFieldInput.widthAnchor.constraint(
                equalTo: labelTextFieldButtonStack.widthAnchor,
                multiplier: 0.9
            ),
            
            buttonInput.heightAnchor.constraint(
                equalToConstant: 5
            ),
            buttonInput.widthAnchor.constraint(
                equalToConstant: 100
            ),
            
            imageLabelStack.topAnchor.constraint(equalTo: buttonInput.topAnchor, constant: 30),
            imageLabelStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLabelStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imageLabelStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
}
//MARK: - ICustomButtonDelegate
extension FindImageViewController: ICustomButtonDelegate {
    func actionButton(_ button: UIButton) {
        
    }
    
    
}
//MARK: - UITextFieldDelegate
extension FindImageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text ?? ""
        if !text.isEmpty {
            
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        func showText() {
            let text = textField.text ?? ""
            let arrayImageModel = cartoonDataManager?.findImage(text)
            
            if let findImage = arrayImageModel?.imageName {
                imageView.isHidden = false
                imageView.updateImageView(findImage) // Предполагается, что здесь нужно использовать findImage
                textLabelFindImage.text = text
                textLabel.text = "Такая картинка есть"
            } else {
                // Обработка случая, когда картинка не найдена
                imageView.isHidden = true
                textLabelFindImage.text = ""
                textLabel.text = "Картинка не найдена"
            }
        }
    }
}
    //MARK: - Override touchesBegan
extension FindImageViewController {
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
        }
    }




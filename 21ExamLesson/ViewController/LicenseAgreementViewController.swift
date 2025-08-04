//  Created by mac on 04.08.2025.
//
import UIKit


final class LicenseAgreementViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let labelText = UILabel()
    private let labelTitle = UILabel()
    
    private let textManagerPrint = TextManager()
    
    var cartoonDataManager: CartoonDataProcessing?
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
//MARK: - Setting View
private extension LicenseAgreementViewController {
    func setupView() {
        addSubViews()
        setupScrollView()
        setupContentView()
        setupLabel()
        setupLayout()
    }
    
    func addSubViews() {
        view.backgroundColor = .lightGray
        view.addSubview(scrollView)
    }
}
//MARK: - Setting SubViews
private extension LicenseAgreementViewController {
    func setupScrollView() {
        scrollView.addSubview(contentView)
    }
    func setupContentView() {
        contentView.backgroundColor = .white
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelText)
    }
    func setupLabel() {
        labelText.text = textManagerPrint.getText()
        labelText.font = .systemFont(ofSize: 16)
        labelText.textColor = .black
        labelText.numberOfLines = 0
        
        labelTitle.text = "LICENSED APPLICATION END USER LICENSE AGREEMENT"
        labelTitle.font = .systemFont(ofSize: 16)
        labelTitle.textAlignment = .center
        labelTitle.textColor = .black
        labelTitle.numberOfLines = 0
    }
}
//MARK: - Setup Layout
private extension LicenseAgreementViewController {
    func setupLayout() {
        [scrollView, contentView,labelTitle, labelText].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            
            scrollView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            
            contentView.topAnchor.constraint(
                equalTo: scrollView.topAnchor
            ),
            contentView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor
            ),
            contentView.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor
            ),
            contentView.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor
            ),
            contentView.widthAnchor.constraint(
                equalToConstant: 400
            ),
            contentView.heightAnchor.constraint(
                equalToConstant: 1500
            ),
            
            labelTitle.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 15
            ),
            labelTitle.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 5
            ),
            labelTitle.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: 5
            ),
            
            labelText.topAnchor.constraint(
                equalTo: labelTitle.topAnchor,
                constant: 50
            ),
            labelText.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 25
            ),
            labelText.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -25
            )
        ])
    }
}

//  Created by mac on 01.08.2025.
//
import UIKit

final class PanImageViewController: UIViewController {
    
    var cartoonDataManager: CartoonDataProcessing?
    
    private let imageViewMoving = ImageView(imageName: "berserk")
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private var panGestureAnchorPoint: CGPoint?
    
    private var centerYConstraint: NSLayoutConstraint!
    private var centerXConstraint: NSLayoutConstraint!
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupGestureRecognizers()
    }
    
    @objc
    func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else {
            return
        }
        
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
            let gesturePoint = gestureRecognizer.location(in: view)
            
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            centerYConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
        case .cancelled, .ended:
            panGestureAnchorPoint = nil
        case .possible, .failed:
            break
        @unknown default:
            break
        }
    }
}
//MARK: - Setting View and UIGesture
private extension PanImageViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(imageViewMoving)
    }
    func setupGestureRecognizers() {
        panGestureRecognizer.addTarget(
            self,
            action: #selector(handlePanGesture(_:))
        )
        
        imageViewMoving.addGestureRecognizer(panGestureRecognizer)
    }
}
//MARK: - Setup Layout
private extension PanImageViewController {
    func setupLayout() {
        imageViewMoving.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = imageViewMoving.widthAnchor.constraint(
            equalToConstant: 150
        )
        let heightConstraint = imageViewMoving.heightAnchor.constraint(
            equalToConstant: 150
        )
        
        centerYConstraint = imageViewMoving.centerYAnchor.constraint(
            equalTo: view.centerYAnchor
        )
        centerXConstraint = imageViewMoving.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        )
        
        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,
            centerYConstraint,
            centerXConstraint
        ])
    }
}

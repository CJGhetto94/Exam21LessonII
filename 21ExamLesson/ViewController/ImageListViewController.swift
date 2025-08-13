//  Created by mac on 12.08.2025.
//
import UIKit

final class ImageListViewController: UIViewController {
    
    private let cellIdentifier = "cellIdentifier"
    
    private var editFlag = false
    
    var cartoonDataManager: CartoonDataProcessing! //хранит методы
    var cartoonManager: ICartoonManager? //хранит массив
    private let cartoonGetArray = CartoonManager()
    
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
//MARK: - Setting View
extension ImageListViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupTableView()
        setupLayout()
    }
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
}
//MARK: - Setup Layout
extension ImageListViewController {
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellCount = cartoonGetArray.getCartoon().count
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.accessoryType = .checkmark
        
        
        var configuration = UIListContentConfiguration.cell()
        
        let cartoon = cartoonGetArray.getCartoon()[indexPath.row]
        
        configuration.text = cartoon.cartoonName
        configuration.image = UIImage(named: cartoon.imageName)
        configuration.imageProperties.maximumSize = CGSize(width: 50, height: 50)
    
        cell.contentConfiguration = configuration
        
        return cell
    }
    
}
extension ImageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let checkMarkAction = UIContextualAction(style: .destructive, title: "Mark") { _, cell, completion in
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completion in
            self.cartoonDataManager.removeCartoon(index: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        checkMarkAction.backgroundColor = .green
        let configuration = UISwipeActionsConfiguration(actions:[deleteAction,checkMarkAction])
        return configuration
    }
    
}

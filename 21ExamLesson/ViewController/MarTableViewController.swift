//  Created by mac on 25.08.2025.
//
import UIKit

final class MarTableViewController: UITableViewController {
    
    var cartoonDataManger: CartoonDataProcessing!
    
    private let cellIdentifier = "cellIdentifier"
    private let cartooCell = CartoonCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CartoonCell.self, forCellReuseIdentifier: cellIdentifier)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartoonDataManger.getEditFlagCartoon().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier, for: indexPath
        ) as? CartoonCell else {
            return UITableViewCell()
        }
        cell.actionButton = { cellHidden in
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            self.cartoonDataManger.toogle(product: self.cartoonDataManger.getEditFlagCartoon()[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
     
        let cartoon = cartoonDataManger.getEditFlagCartoon()[indexPath.row]
        
        cell.configure(cartoon: cartoon)
        
        return cell
        
        
    }
}


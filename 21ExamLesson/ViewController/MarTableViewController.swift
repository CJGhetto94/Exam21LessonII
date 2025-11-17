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
        var cartoon = cartoonDataManger.getEditFlagCartoon()[indexPath.row]
        
        if cartoon.editFlag {
            cartoon.editFlag.toggle()
        } else {
            cell.accessoryType = .none
        }
    
        cell.configure(cartoon: cartoon)
        
        return cell
        
        
    }
}

extension MarTableViewController: ICheckMarkEditFlagDelegate {
    func editFlagAction() {
        cartoonDataManger.editFlagCartoon(index: )
    }
}

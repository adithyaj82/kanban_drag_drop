
import Foundation

import UIKit

extension Column: UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        let destinationIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            // Get last index path of table view.
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }

        coordinator.session.loadObjects(ofClass: NSString.self) { items in
            let stringItems = items as! [String]
            addItems(stringItems)
        }
        
        coordinator.session.loadObjects(ofClass: UIImage.self) { (items) in
            let imageItems = items as! [UIImage]
            print(imageItems)
            addItems(imageItems)
        }
        
        func addItems(_ items: [Any]){
            for (index, item) in items.enumerated() {
                let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                if DragDropSession_AuxSingleton.indexes.count == 0 {
                    self.stickers.insert(item, at: indexPath.row)
                } else
                if !(self === DragDropSession_AuxSingleton.tableViews[index]){
                    self.stickers.insert(item, at: indexPath.row)
                } else {
                    let initialIndexPath = DragDropSession_AuxSingleton.indexes[index]
                    self.stickers.remove(at: initialIndexPath.row)
                    self.stickers.insert(item, at: indexPath.row)
                }
            }
            DragDropSession_AuxSingleton.removeAll()
            self.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self) || session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if DragDropSession_AuxSingleton.indexes.count == 0 {
            return UITableViewDropProposal(operation: .copy, intent: .automatic)
        }
        return UITableViewDropProposal(operation: .move, intent: .automatic)
        
    }
    
}


import Foundation
import UIKit

extension Column: UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = self.dragItem(indexPath: indexPath)
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        let dragItem = self.dragItem(indexPath: indexPath)
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            DragDropSession_AuxSingleton.clean()
        }
    }

    private func dragItem(indexPath: IndexPath) -> UIDragItem {
        
        DragDropSession_AuxSingleton.addSessionItem(from: self, at: indexPath)
        
        var itemProvider: NSItemProvider!
        if let cell = self.cellForRow(at: indexPath) as? PostItTVCell {
            itemProvider = NSItemProvider(object: cell.conteudo.text! as NSItemProviderWriting)
        } else if let cell = self.cellForRow(at: indexPath) as? PostItImageTVCell{
            itemProvider = NSItemProvider(object: cell.imagem.image! as NSItemProviderWriting)
        }
        let dragItem = UIDragItem(itemProvider: itemProvider)
        return dragItem
    }
    
    func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        let estilo = UIDragPreviewParameters()
        estilo.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
        return estilo
    }
}

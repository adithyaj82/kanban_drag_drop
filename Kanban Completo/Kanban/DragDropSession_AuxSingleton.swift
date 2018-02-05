
import Foundation
import UIKit

class DragDropSession_AuxSingleton {
    
    public static var tableViews: [Column]! = []
    public static var indexes: [IndexPath]! = []
    
    public static func clean(){
        tableViews = [Column]()
        indexes = [IndexPath]()
    }
    
    public static func addSessionItem(from column: Column, at indexPath: IndexPath){
        tableViews.append(column)
        indexes.append(indexPath)
    }
    
    public static func removeAll() {
        for c in 0..<tableViews.count {
            tableViews[c].stickers.remove(at: indexes[c].row)
            tableViews[c].reloadData()
        }
        clean()
    }
    
    
}


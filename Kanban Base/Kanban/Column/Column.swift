
import UIKit

class Column: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var title: String!
    var color: UIColor!
    var stickers: [Any]!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
        
        self.dragDelegate = self
        self.dropDelegate = self
    }
 
    // MARK: - Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stickers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if let table = tableView as? Column {
            let conteudo:Any = table.stickers[indexPath.row]
            if (conteudo as AnyObject).isKind(of: UIImage.self) {
                cell = tableView.dequeueReusableCell(withIdentifier: "image", for: indexPath) as! PostItImageTVCell
                (cell as! PostItImageTVCell).awakeFromNib(image_Post_It: (conteudo as! UIImage) )
            }else{
                cell = tableView.dequeueReusableCell(withIdentifier: "post", for: indexPath) as! PostItTVCell
                (cell as! PostItTVCell).awakeFromNib(conteudo_Post_It: (conteudo as! String) )
            }

            cell.tag = indexPath.row
        } else {
            print("Impossible to cast to Column from UITableView")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cgRect = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100)
        let headerView: UIView = UIView(frame: cgRect)
        headerView.backgroundColor = self.color
        
        let label = UILabel(frame: headerView.frame)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = self.title
        
        headerView.addSubview(label)

        return headerView
    }
    
}

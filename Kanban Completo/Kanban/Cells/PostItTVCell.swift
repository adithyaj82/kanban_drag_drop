
import UIKit

class PostItTVCell: UITableViewCell {

    // OUTLETs
    @IBOutlet weak var conteudo: UILabel!
    
    func awakeFromNib(conteudo_Post_It: String) {
        super.awakeFromNib()
        self.conteudo.text = conteudo_Post_It
        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}


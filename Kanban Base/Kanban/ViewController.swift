
import UIKit

class ViewController: UIViewController {
    
    // OUTLETs
    @IBOutlet weak var sprintBacklog: Column!
    @IBOutlet weak var toDo: Column!
    @IBOutlet weak var doing: Column!
    @IBOutlet weak var testing: Column!
    @IBOutlet weak var done: Column!
    @IBOutlet weak var discarded: Column!
    
    // Variaveis
    var sprintBacklog_DataSource: [Any] = ["Pensar", #imageLiteral(resourceName: "opa"), "Refletir", "Pesquisar", "Olhar"]
    var toDo_DataSource: [Any] = ["Fazer coisas", #imageLiteral(resourceName: "opa"), "Programar"]
    var doing_DataSource: [Any] = ["Pensando", "Fazendo", #imageLiteral(resourceName: "opa"),"Digitando"]
    var testing_DataSource: [Any] = ["Tentando", "Analisando", #imageLiteral(resourceName: "opa")]
    var done_DataSource: [Any] = [#imageLiteral(resourceName: "opa"), "Completando", "Respirando", "Acabando"]
    var discarded_DataSource: [Any] = ["Inutil", #imageLiteral(resourceName: "opa"), "Não serve"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sprintBacklog.stickers = sprintBacklog_DataSource
        self.sprintBacklog.title = "Sprint Backlog"
        self.sprintBacklog.color = UIColor.blue
            
        self.toDo.stickers = toDo_DataSource
        self.toDo.title = "To Do"
        self.toDo.color = UIColor.red
        
        self.doing.stickers = doing_DataSource
        self.doing.title = "Doing"
        self.doing.color = UIColor.magenta
        
        self.testing.stickers = testing_DataSource
        self.testing.title = "Testing"
        self.testing.color = UIColor.orange
        
        self.done.stickers = done_DataSource
        self.done.title = "Done"
        self.done.color = UIColor.purple
        
        self.discarded.stickers = discarded_DataSource
        self.discarded.title = "Discarder"
        self.discarded.color = UIColor.gray
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Status Bar
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}


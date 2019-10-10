//
import UIKit

class TableviewView: UIView {

    lazy var tableView: UITableView = {
       let foodTableView = UITableView()
        foodTableView.frame = bounds
        foodTableView.register(RecepiesCell.self, forCellReuseIdentifier: "fooCell")
        return foodTableView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        viewSetup()
    }
    
    private func viewSetup() {
        addSubview(tableView)
    }
    
}

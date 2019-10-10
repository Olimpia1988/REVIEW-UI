import UIKit

class ViewController: UIViewController {
    
    var foodView = TableviewView()
    
    var recepies = [MoreData]() {
        didSet {
            foodView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsData()
        setDelegation()
        addSubviews()
    }
    
    func setDelegation() {
        foodView.tableView.delegate = self
        foodView.tableView.dataSource = self
    }
    
    func getUsData() {
        APIManager.manager.getData { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                self.recepies = data
            }
        }
    }
    
    func addSubviews() {
        self.view.addSubview(foodView.tableView)
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recepies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "fooCell") as? RecepiesCell else { return UITableViewCell() }
        var singleRecepie = recepies[indexPath.row]
        cell.name.text = singleRecepie.recipe.label
        return cell
    }
    
    
}


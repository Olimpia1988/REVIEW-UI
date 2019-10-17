import UIKit

class DetailedViewController: UIViewController {
    
    var detailedView = DetailedView()
    var singleRecepie: MoreData!

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        detailedView.backgroundColor = #colorLiteral(red: 0.9203030467, green: 0.8145338893, blue: 0.9443410039, alpha: 1)
        setupUI()
        
    }
    
    func addSubviews() {
        self.view.addSubview(detailedView)
    }
    
    
    func setupUI() {
        ImageHelper.shared.getImage(urlString: singleRecepie.recipe.image) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let imageData):
                DispatchQueue.main.async {
                    self.detailedView.recepieImage.image = imageData
                }
            }
        }
        self.detailedView.recepieName.text = singleRecepie.recipe.label
    }
   

}

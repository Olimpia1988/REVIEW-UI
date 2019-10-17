import UIKit

class DetailedView: UIView {

    lazy var recepieImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var recepieName: UILabel = {
        let name = UILabel()
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
    }
    
    private func commonInit() {
        addSubview(recepieImage)
        addSubview(recepieName)
        setContrains()
    }
    
    func setContrains() {
        
        recepieImage.translatesAutoresizingMaskIntoConstraints = false
        [recepieImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11), recepieImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), recepieImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11), recepieImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80)].forEach{ $0.isActive = true }
        
    }
    
    
    
}

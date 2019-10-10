import UIKit

class DetailedView: UIView {

    lazy var recepieImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        commonInit()
    }
    
    private func commonInit() {
        addSubview(recepieImage)
        setContrains()
    }
    
    func setContrains() {
        recepieImage.translatesAutoresizingMaskIntoConstraints = false
        
        [recepieImage.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), recepieImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach{ $0.isActive = true }
    }
    
    
    
}

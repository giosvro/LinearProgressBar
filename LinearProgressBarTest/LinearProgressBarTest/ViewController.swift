import UIKit

class ViewController: UIViewController {
    
    var benefitsLevel: [BenefitModelMock]
    
    init() {
        benefitsLevel = BenefitModelMock.mockArray()
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
}

extension ViewController: CodeView {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
}

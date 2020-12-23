import UIKit

class ViewController: UIViewController {
    
    var benefitLevel: BenefitModel
    
    init() {
        super.init(nibName: nil, bundle: nil)
        benefitLevel = BenefitModel(
            levels: BenefitLevels(
                current: BenefitLevel(id: .levelFour,
                                      name: <#T##String#>,
                                      purchases: <#T##Int?#>,
                                      purchasesExpected: <#T##Int#>,
                                      purchasesPercent: <#T##Double?#>,
                                      totalSpent: <#T##String?#>,
                                      totalSpentExpected: <#T##String#>,
                                      totalSpentPercent: <#T##Double?#>,
                                      expirationDate: <#T##String?#>
                ),
                next: nil
            )
        )
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

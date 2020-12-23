import UIKit

class ViewController: UIViewController {
    
    var benefitsLevel: [BenefitModelMock]
    var progressView: ProgressView
    let iconImage = UIImage(named: "ic_benefit_purchase")
    
    init() {
        benefitsLevel = BenefitModelMock.mockArray()
        progressView = ProgressView(frame: .zero)
        progressView.progress = 0
        progressView.icon = iconImage
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
        view.addSubview(progressView)
    }
    
    func setupConstraints() {
        progressView.anchor(height: 20, width: 300)
        progressView.anchorCenterSuperview(priority: .defaultHigh)
    }
}

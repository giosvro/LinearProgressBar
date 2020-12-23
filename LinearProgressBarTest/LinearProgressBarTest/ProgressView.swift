import UIKit

public final class ProgressView: UIView {
    public var progressColor: UIColor = .green

    public var emptyBackgroundColor: UIColor = .gray
    
    public var icon: UIImage? {
        didSet {
            iconImageView.image = icon
        }
    }

    public var progress: CGFloat = 0 {
        didSet {
            setProgress()
        }
    }

    private lazy var progressLayer: CAShapeLayer = {
        let progressLayer = CAShapeLayer()
        progressLayer.fillColor = progressColor.cgColor
        return progressLayer
    }()

    private lazy var iconImageView = UIImageView.Factory.build(
        contentMode: .center,
        backgroundColor: progressColor,
        accessibilityIdentifier: "progressViewIconView"
    )

    private var iconLeadingConstraint: NSLayoutConstraint?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func draw(_: CGRect) {
        layer.insertSublayer(progressLayer, below: iconImageView.layer)
        layer.cornerRadius = frame.height / 2
        iconImageView.layer.cornerRadius = layer.cornerRadius
        setProgress()
    }

    private func setProgress() {
        if progress > 1 {
            progress = 1
        }
        let availableWidth = frame.width - layer.cornerRadius * 2
        let progressWidth = availableWidth * progress
        progressLayer.path = UIBezierPath(rect: CGRect(
            x: bounds.origin.x,
            y: bounds.origin.y,
            width: layer.cornerRadius + progressWidth,
            height: bounds.size.height
        )).cgPath

        UIView.animate(withDuration: 3) { [weak self] in
            self?.updateImageConstraint(progressWidth: progressWidth)
        }
    }

    private func updateImageConstraint(progressWidth: CGFloat) {
        iconLeadingConstraint?.constant = progressWidth
        layoutIfNeeded()
    }
}

extension ProgressView: CodeView {
    public func buildViewHierarchy() {
        addSubview(iconImageView)
    }

    public func setupConstraints() {
        iconImageView.anchorCenterYToSuperview()
        iconImageView.anchor(heightAnchor: heightAnchor, widthAnchor: heightAnchor)
        iconLeadingConstraint = iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        iconLeadingConstraint?.isActive = true
    }

    public func setupAdditionalConfiguration() {
        backgroundColor = emptyBackgroundColor
        clipsToBounds = true
    }
}

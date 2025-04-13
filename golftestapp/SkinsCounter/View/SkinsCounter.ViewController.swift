import UIKit

public class SkinsCounterViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    public var handler: SkinsCounter.IViewHandler?

    private let holeLabel = UILabel()
    private let strokesLabel = UILabel()
    private let pickerView = UIPickerView()
    private let skinsLabel = UILabel()
    private let nextHoleButton = UIButton(type: .system)

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        setupUI()
    }

    private func setupUI() {
        // HOLE LABEL
        holeLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        holeLabel.text = "Hole \(handler?.skinsCounterViewHandlerHoleNumber ?? 0)"
        holeLabel.textAlignment = .center
        holeLabel.textColor = .label

        // SKINS LABEL
        skinsLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        skinsLabel.text = "Skins: \(handler?.skinsCounterViewHandlerSkinsCount ?? 0)"
        skinsLabel.textAlignment = .center
        skinsLabel.textColor = .secondaryLabel

        // PICKER VIEW
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: false)
        pickerView.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        // STROKES LABEL
        strokesLabel.text = "strokes"
        strokesLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        strokesLabel.textColor = .secondaryLabel
        strokesLabel.textAlignment = .left

        // NEXT HOLE BUTTON
        nextHoleButton.setTitle("Next Hole  ➡️", for: .normal)
        nextHoleButton.setTitleColor(.white, for: .normal)
        nextHoleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        nextHoleButton.layer.cornerRadius = 14
        nextHoleButton.clipsToBounds = true
        nextHoleButton.addTarget(self, action: #selector(nextHoleTapped), for: .touchUpInside)

        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemGreen.cgColor, UIColor.systemBlue.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.cornerRadius = 14
        gradient.frame = CGRect(x: 0, y: 0, width: 240, height: 50)
        nextHoleButton.layer.insertSublayer(gradient, at: 0)

        // STACK: PICKER + "strokes"
        let pickerStack = UIStackView(arrangedSubviews: [pickerView, strokesLabel])
        pickerStack.axis = .horizontal
        pickerStack.spacing = 16
        pickerStack.alignment = .center
        pickerStack.distribution = .fill

        // MAIN STACK
        let mainStack = UIStackView(arrangedSubviews: [holeLabel, pickerStack, skinsLabel, nextHoleButton])
        mainStack.axis = .vertical
        mainStack.spacing = 32
        mainStack.alignment = .center
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            pickerView.widthAnchor.constraint(equalToConstant: 100),
            pickerView.heightAnchor.constraint(equalToConstant: 150),

            nextHoleButton.widthAnchor.constraint(equalToConstant: 240),
            nextHoleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Picker View

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        handler?.skinsCounterViewHandlerStrokeCount = row
    }

    // MARK: - Actions

    @objc private func nextHoleTapped() {
        handler?.skinsCounterViewHandlerOnNextHoleTapped()

        pickerView.selectRow(0, inComponent: 0, animated: true)

        UIView.transition(with: holeLabel, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
            self?.holeLabel.text = "Hole \(self?.handler?.skinsCounterViewHandlerHoleNumber ?? 0)"
        }

        UIView.transition(with: skinsLabel, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
            self?.skinsLabel.text = "Skins: \(self?.handler?.skinsCounterViewHandlerSkinsCount ?? 0)"
        }
    }
}

import UIKit

class SkinsLeaderboardCell: UITableViewCell {
    
    private let playerNameLabel = UILabel()
    private let skinsLabel = UILabel()
    private let carryCountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with entry: SkinsTableEntry, isWinner: Bool) {
        playerNameLabel.text = entry.playerName
        skinsLabel.text = "Skins: \(entry.skinsWon)"
        carryCountLabel.text = "Carried: \(entry.carryCount)"
        
        if isWinner {
            contentView.backgroundColor = .systemGreen.withAlphaComponent(0.2)
            playerNameLabel.textColor = .systemGreen
            addPulseAnimation() // Добавляем пульсацию для победителя
        } else {
            contentView.backgroundColor = .white
            playerNameLabel.textColor = .label
        }
        
        setNeedsLayout()
    }
    
    private func setupCell() {
        contentView.addSubview(playerNameLabel)
        contentView.addSubview(skinsLabel)
        contentView.addSubview(carryCountLabel)
        
        playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        skinsLabel.translatesAutoresizingMaskIntoConstraints = false
        carryCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        playerNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        skinsLabel.font = UIFont.systemFont(ofSize: 14)
        carryCountLabel.font = UIFont.systemFont(ofSize: 14)
        
        playerNameLabel.textAlignment = .left
        skinsLabel.textAlignment = .center
        carryCountLabel.textAlignment = .right
        
        NSLayoutConstraint.activate([
            playerNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            playerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            skinsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            skinsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            carryCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            carryCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            carryCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
        
        let separatorLine = UIView()
        separatorLine.backgroundColor = .systemGray
        contentView.addSubview(separatorLine)
        
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    // Анимация пульсации
    private func addPulseAnimation() {
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.fromValue = 1.0
        pulse.toValue = 1.1
        pulse.duration = 0.5
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        contentView.layer.add(pulse, forKey: "pulse")
    }
}

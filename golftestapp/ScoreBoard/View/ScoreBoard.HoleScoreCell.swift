import UIKit

public class ScoreBoardHoleScoreCell: UITableViewCell {
    
    private let holeLabel = UILabel()
    private let playersStack = UIStackView()
    private let skinBadge = UILabel()
    private let carryLabel = UILabel()
    private let bgView = UIView()
    
    private let winnerColor = UIColor.systemGreen.withAlphaComponent(0.2)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        bgView.layer.cornerRadius = 12
        bgView.backgroundColor = UIColor.secondarySystemBackground
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOpacity = 0.05
        bgView.layer.shadowRadius = 4
        bgView.layer.shadowOffset = CGSize(width: 0, height: 2)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        holeLabel.font = .systemFont(ofSize: 16, weight: .semibold)

        playersStack.axis = .vertical
        playersStack.spacing = 6
        playersStack.alignment = .leading
        playersStack.translatesAutoresizingMaskIntoConstraints = false

        skinBadge.font = .systemFont(ofSize: 14, weight: .bold)
        skinBadge.textColor = .white
        skinBadge.backgroundColor = .systemOrange
        skinBadge.textAlignment = .center
        skinBadge.layer.cornerRadius = 10
        skinBadge.clipsToBounds = true
        skinBadge.isHidden = true
        skinBadge.translatesAutoresizingMaskIntoConstraints = false
        skinBadge.widthAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
        skinBadge.heightAnchor.constraint(equalToConstant: 24).isActive = true

        carryLabel.text = "Carried 🧳"
        carryLabel.font = .systemFont(ofSize: 13, weight: .medium)
        carryLabel.textColor = .systemGray
        carryLabel.isHidden = true
        carryLabel.translatesAutoresizingMaskIntoConstraints = false

        let topStack = UIStackView(arrangedSubviews: [holeLabel, skinBadge, carryLabel])
        topStack.axis = .horizontal
        topStack.spacing = 10
        topStack.alignment = .center
        topStack.distribution = .equalSpacing
        topStack.translatesAutoresizingMaskIntoConstraints = false

        let verticalStack = UIStackView(arrangedSubviews: [topStack, playersStack])
        verticalStack.axis = .vertical
        verticalStack.spacing = 8
        verticalStack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(bgView)
        bgView.addSubview(verticalStack)

        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            verticalStack.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 12),
            verticalStack.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -12),
            verticalStack.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16)
        ])
    }

    func configure(with score: HoleScore) {
        holeLabel.text = "Hole \(score.holeNumber)"
        
        playersStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for player in score.playerScores {
            let isWinner = (player.playerName == score.skinOwner)
            
            let nameLabel = UILabel()
            nameLabel.font = .systemFont(ofSize: 15, weight: isWinner ? .semibold : .regular)
            nameLabel.text = "\(player.playerName): \(player.strokes)"
            nameLabel.textColor = isWinner ? .label : .secondaryLabel
            
            let container = UIView()
            container.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 4),
                nameLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -4),
                nameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
                nameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8)
            ])

            if isWinner && score.skinsWon > 0 {
                container.backgroundColor = winnerColor
                container.layer.cornerRadius = 6
            }

            playersStack.addArrangedSubview(container)
        }
        
        if let owner = score.skinOwner {
            skinBadge.isHidden = false
            skinBadge.text = "Skin → \(owner) ×\(score.skinsWon)"
        } else {
            skinBadge.isHidden = true
        }

        carryLabel.isHidden = !score.isSkinCarried
        if score.isSkinCarried {
            carryLabel.text = "Carried 🧳 (\(score.carryCountBefore))"
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

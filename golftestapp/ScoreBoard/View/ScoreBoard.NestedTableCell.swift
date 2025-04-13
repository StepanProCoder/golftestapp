import UIKit

public class ScoreBoardNestedTableCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    private var leaderboardEntries: [SkinsTableEntry] = []
    private var holeScores: [HoleScore] = []
    private var winner: SkinsTableEntry?

    private let innerTableView = UITableView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        innerTableView.dataSource = self
        innerTableView.delegate = self
        innerTableView.isScrollEnabled = false
        innerTableView.separatorStyle = .singleLine
        innerTableView.layer.cornerRadius = 12
        innerTableView.clipsToBounds = true
        innerTableView.translatesAutoresizingMaskIntoConstraints = false
        innerTableView.backgroundColor = .systemBackground

        innerTableView.register(ScoreBoardSkinsLeaderBoardCell.self, forCellReuseIdentifier: "SkinsLeaderboardCell")
        innerTableView.register(ScoreBoardHoleScoreCell.self, forCellReuseIdentifier: "HoleScoreCell")

        contentView.addSubview(innerTableView)

        NSLayoutConstraint.activate([
            innerTableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            innerTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            innerTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            innerTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureWithLeaderboard(entries: [SkinsTableEntry], winner: SkinsTableEntry?) {
        self.leaderboardEntries = entries
        self.winner = winner
        self.holeScores = []
        innerTableView.reloadData()
    }

    func configureWithHoleScores(_ scores: [HoleScore]) {
        self.holeScores = scores
        self.leaderboardEntries = []
        self.winner = nil
        innerTableView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return leaderboardEntries.isEmpty ? 164.0 : 44.0
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboardEntries.isEmpty ? holeScores.count : leaderboardEntries.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !leaderboardEntries.isEmpty {
            let entry = leaderboardEntries[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SkinsLeaderboardCell", for: indexPath) as? ScoreBoardSkinsLeaderBoardCell
            else { return UITableViewCell() }
            cell.configure(with: entry, isWinner: winner?.playerName == entry.playerName)
            return cell
        } else {
            let score = holeScores[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HoleScoreCell", for: indexPath) as? ScoreBoardHoleScoreCell
            else { return UITableViewCell() }
            cell.configure(with: score)
            return cell
        }
    }
}

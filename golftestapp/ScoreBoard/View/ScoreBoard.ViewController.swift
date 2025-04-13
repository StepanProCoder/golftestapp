import UIKit

class ScoreBoardViewController: UITableViewController {

    private var holeScores: [HoleScore] = []
    private var skinsTable = SkinsTable()
    private var winner: SkinsTableEntry?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Full Scoreboard"
        tableView.register(NestedTableCell.self, forCellReuseIdentifier: "NestedTableCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGroupedBackground
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200

        loadData()
    }

    private func loadData() {
        let sampleData: [[PlayerScore]] = [
            [PlayerScore(playerName: "Alice", strokes: 5), PlayerScore(playerName: "Bob", strokes: 5)],
            [PlayerScore(playerName: "Alice", strokes: 4), PlayerScore(playerName: "Bob", strokes: 4)],
            [PlayerScore(playerName: "Alice", strokes: 3), PlayerScore(playerName: "Bob", strokes: 4)],
            [PlayerScore(playerName: "Alice", strokes: 4), PlayerScore(playerName: "Bob", strokes: 5)],
            [PlayerScore(playerName: "Alice", strokes: 6), PlayerScore(playerName: "Bob", strokes: 6)],
            [PlayerScore(playerName: "Alice", strokes: 3), PlayerScore(playerName: "Bob", strokes: 2)],
        ]

        holeScores = calculateHoleScores(from: sampleData)

        for hole in holeScores {
            for player in hole.playerScores {
                skinsTable.addPlayer(player.playerName)
            }
        }

        for hole in holeScores {
            skinsTable.updateForHole(holeScore: hole)
        }

        winner = skinsTable.getWinner()
        tableView.reloadData()
    }

    private func calculateHoleScores(from allHoles: [[PlayerScore]]) -> [HoleScore] {
        var results: [HoleScore] = []
        var carryCount = 0

        for (index, scores) in allHoles.enumerated() {
            let winner = determineWinner(from: scores)
            if let winner = winner {
                let skinsWon = max(1, carryCount + 1)
                results.append(HoleScore(holeNumber: index + 1, playerScores: scores, skinOwner: winner, isSkinCarried: false, skinsWon: skinsWon, carryCountBefore: carryCount))
                carryCount = 0
            } else {
                carryCount += 1
                results.append(HoleScore(holeNumber: index + 1, playerScores: scores, skinOwner: nil, isSkinCarried: true, skinsWon: 0, carryCountBefore: carryCount))
            }
        }

        return results
    }

    private func determineWinner(from scores: [PlayerScore]) -> String? {
        let minStrokes = scores.map { $0.strokes }.min()
        let winners = scores.filter { $0.strokes == minStrokes }
        return winners.count == 1 ? winners.first?.playerName : nil
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // Вложенные таблицы внутри одной ячейки
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let (rowCount, value) = indexPath.section == 0 ? (skinsTable.getSortedEntries().count, 44) : (holeScores.count, 124)
        return CGFloat(rowCount * value)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Leaderboard" : "Hole-by-Hole Score"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NestedTableCell", for: indexPath) as! NestedTableCell

        if indexPath.section == 0 {
            cell.configureWithLeaderboard(entries: skinsTable.getSortedEntries(), winner: winner)
        } else {
            cell.configureWithHoleScores(holeScores)
        }

        return cell
    }
}

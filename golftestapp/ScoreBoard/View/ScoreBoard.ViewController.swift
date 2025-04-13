import UIKit

public class ScoreBoardViewController: UITableViewController {
    
    public var handler: ScoreBoard.IViewHandler?

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Full Scoreboard"
        tableView.register(ScoreBoardNestedTableCell.self, forCellReuseIdentifier: "NestedTableCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGroupedBackground
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }

    // MARK: - UITableViewDataSource

    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let handler else { return 0 }
        let (rowCount, value) = indexPath.section == 0 ? (handler.scoreBoardViewHandlerLeaderBoard.count, 44) : (handler.scoreBoardViewHandlerHoleScores.count, 164)
        return CGFloat(rowCount * value)
    }

    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Leaderboard" : "Hole-by-Hole Score"
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NestedTableCell", for: indexPath) as? ScoreBoardNestedTableCell,
              let handler
        else { return UITableViewCell() }

        if indexPath.section == 0 {
            cell.configureWithLeaderboard(entries: handler.scoreBoardViewHandlerLeaderBoard, winner: handler.scoreBoardViewHandlerWinner)
        } else {
            cell.configureWithHoleScores(handler.scoreBoardViewHandlerHoleScores)
        }

        return cell
    }
}

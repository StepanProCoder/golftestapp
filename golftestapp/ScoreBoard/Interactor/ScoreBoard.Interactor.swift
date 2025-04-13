//
//  ScoreBoard.Interactor.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 13.04.2025.
//

public class ScoreBoardInteractor {
    public var pullService: ScoreBoard.IOtherPlayersPullService?
    
    func determineWinner(from scores: [PlayerScore]) -> String? {
        let minStrokes = scores.map { $0.strokes }.min()
        let winners = scores.filter { $0.strokes == minStrokes }
        return winners.count == 1 ? winners.first?.playerName : nil
    }
}

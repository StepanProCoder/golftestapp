//
//  ScoreBoard.Interactor.OtherPlayersPullServiceMock.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 13.04.2025.
//

public class ScoreBoardOtherPlayersPullServiceMock: ScoreBoard.IOtherPlayersPullService {
    public func scoreBoardOtherPlayersPullServiceFetch() -> [PlayerScore] {
        let sampleData = [PlayerScore(playerName: "Alice", strokes: Int.random(in: 1...10)), PlayerScore(playerName: "Bob", strokes: Int.random(in: 1...10))]
        return sampleData
    }
}

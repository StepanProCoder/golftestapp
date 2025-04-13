//
//  ScoreBoard.IInteractor.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 13.04.2025.
//

public protocol IScoreBoardInteractor {
    func scoreBoardInteractorPullOtherPlayersScore() -> [PlayerScore]
    func scoreBoardInteractorCalculateHoleScore(from currentPlayersScore: [PlayerScore], previousHole: HoleScore?) -> HoleScore
    func scoreBoardInteractorBuildLeaderboard(from holeScores: [HoleScore]) -> [SkinsTableEntry]
}

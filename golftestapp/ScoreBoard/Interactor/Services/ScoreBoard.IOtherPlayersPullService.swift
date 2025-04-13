//
//  ScoreBoard.Interactor.IOtherPlayersPullService.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 13.04.2025.
//

public protocol IScoreBoardOtherPlayersPullService {
    func scoreBoardOtherPlayersPullServiceFetch() -> [PlayerScore]
}

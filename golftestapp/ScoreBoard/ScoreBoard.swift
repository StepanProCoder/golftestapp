//
//  ScoreBoard.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 12.04.2025.
//

public enum ScoreBoard {
    public typealias View = ScoreBoardViewController
    public typealias Presenter = ScoreBoardPresenter
    public typealias Interactor = ScoreBoardInteractor
    
    public typealias IView = IScoreBoardView
    public typealias IViewHandler = IScoreBoardViewHandler
    public typealias IInteractor = IScoreBoardInteractor
    
    public typealias Builder = ScoreBoardBuilder
    
    public typealias HoleScoreCell = ScoreBoardHoleScoreCell
    public typealias NestedTableCell = ScoreBoardNestedTableCell
    public typealias SkinsLeaderBoardCell = ScoreBoardSkinsLeaderBoardCell
    
    public typealias OtherPlayersPullService = ScoreBoardOtherPlayersPullService
    public typealias IOtherPlayersPullService = IScoreBoardOtherPlayersPullService
    public typealias OtherPlayersPullServiceMock = ScoreBoardOtherPlayersPullServiceMock
}

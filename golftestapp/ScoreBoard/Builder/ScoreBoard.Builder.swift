//
//  ScoreBoard.Builder.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 13.04.2025.
//

public struct ScoreBoardBuilder {
    public func build() -> (ScoreBoard.View, ScoreBoard.Presenter) {
        let view = ScoreBoard.View()
        let presenter = ScoreBoard.Presenter()
        let interactor = ScoreBoard.Interactor()
        let pullService = ScoreBoard.OtherPlayersPullServiceMock()
        
        view.handler = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.pullService = pullService
        
        return (view, presenter)
    }
}

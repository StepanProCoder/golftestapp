//
//  SkinsCounter.Builder.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 12.04.2025.
//

public struct SkinsCounterBuilder {
    public func build() -> SkinsCounter.View {
        let view = SkinsCounter.View()
        let presenter = SkinsCounter.Presenter()
        let router = SkinsCounter.Router()
        
        let (scoreBoardView, scoreBoardPresenter) = ScoreBoard.Builder().build()
        
        view.handler = presenter
        presenter.router = router
        presenter.delegate = scoreBoardPresenter
        router.parentViewController = view
        router.modalViewController = scoreBoardView
        
        return view
    }
}

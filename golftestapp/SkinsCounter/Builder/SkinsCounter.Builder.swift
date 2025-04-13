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
        
        view.handler = presenter
        return view
    }
}

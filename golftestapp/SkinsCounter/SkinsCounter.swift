//
//  SkinsCounter.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 12.04.2025.
//

public enum SkinsCounter {
    public typealias Presenter = SkinsCounterPresenter
    public typealias View = SkinsCounterViewController
    public typealias Router = SkinsCounterRouter
    
    public typealias IViewHandler = ISkinsCounterViewHandler
    public typealias IRouter = ISkinsCounterRouter
    
    public typealias Builder = SkinsCounterBuilder
    public typealias CalculatorDelegate = SkinsCounterCalculatorDelegate
}

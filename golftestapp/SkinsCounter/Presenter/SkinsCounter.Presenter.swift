//
//  SkinsCounter.Presenter.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 12.04.2025.
//

public class SkinsCounterPresenter {
    public var skinsCounterViewHandlerHoleNumber = 1 {
        didSet {
            delegate?.skinsCounterCalculatorDelegateOnNewHole(hole: skinsCounterViewHandlerHoleNumber)
        }
    }
    public var skinsCounterViewHandlerStrokeCount = 0 {
        didSet {
            guard skinsCounterViewHandlerStrokeCount > 0 else { return }
            delegate?.skinsCounterCalculatorDelegateOnNewStroke(stroke: skinsCounterViewHandlerStrokeCount)
        }
    }
    public var skinsCounterViewHandlerSkinsCount = 1
    
    public var delegate: SkinsCounter.CalculatorDelegate?
}

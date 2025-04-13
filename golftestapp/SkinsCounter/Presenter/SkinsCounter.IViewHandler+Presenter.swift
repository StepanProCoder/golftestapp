//
//  SkinsCounter.IViewHandler+Presenter.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 12.04.2025.
//

extension SkinsCounter.Presenter: SkinsCounter.IViewHandler {
    public var skinsCounterViewHandlerHoleNumber: Int {
        guard let hole = delegate?.skinsCounterCalculatorDelegateHoleNumber,
                hole <= 18
        else { return 18 }
        return hole
    }
    public var skinsCounterViewHandlerStrokeCount: Int {
        delegate?.skinsCounterCalculatorDelegateStrokeCount ?? 0
    }
    public var skinsCounterViewHandlerSkinsCount: Int {
        delegate?.skinsCounterCalculatorDelegateSkinsCount ?? 0
    }
    
    public func skinsCounterViewHandlerOnViewDidload() {
        router?.skinsCounterRouterPresentScoreBoard()
    }
    
    public func skinsCounterViewHandlerOnNewStroke(value: Int) {
        delegate?.skinsCounterCalculatorDelegateStrokeCount = value
    }
    
    public func skinsCounterViewHandlerOnNextHoleTapped() {
        guard delegate?.skinsCounterCalculatorDelegateHoleNumber ?? 0 <= 18 else { return }
        delegate?.skinsCounterCalculatorDelegateHoleNumber += 1
        delegate?.skinsCounterCalculatorDelegateStrokeCount = 0
        router?.skinsCounterRouterExtendScoreBoard()
    }
    
    public func skinsCounterViewHandlerOnResetTapped() {
        delegate?.skinsCounterCalculatorDelegateOnResetSession()
    }
}

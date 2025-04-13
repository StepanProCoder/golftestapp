//
//  SkinsCounter.IViewHandler+Presenter.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 12.04.2025.
//

extension SkinsCounter.Presenter: SkinsCounter.IViewHandler {
    public func skinsCounterViewHandlerOnNextHoleTapped() {
        skinsCounterViewHandlerHoleNumber += 1
        skinsCounterViewHandlerStrokeCount = 0
        skinsCounterViewHandlerSkinsCount = delegate?.skinsCounterCalculatorDelegateComputeSkins() ?? 0
    }
}

//
//  SkinsCounter.SkinsCalculatorDelegate.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 12.04.2025.
//

public protocol SkinsCounterCalculatorDelegate {
    func skinsCounterCalculatorDelegateComputeSkins() -> Int
    func skinsCounterCalculatorDelegateOnNewHole(hole: Int)
    func skinsCounterCalculatorDelegateOnNewStroke(stroke: Int)
}

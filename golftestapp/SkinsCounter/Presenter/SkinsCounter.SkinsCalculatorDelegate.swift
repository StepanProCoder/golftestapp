//
//  SkinsCounter.SkinsCalculatorDelegate.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 12.04.2025.
//

public protocol SkinsCounterCalculatorDelegate {
    var skinsCounterCalculatorDelegateHoleNumber: Int { get set }
    var skinsCounterCalculatorDelegateStrokeCount: Int { get set }
    var skinsCounterCalculatorDelegateSkinsCount: Int { get }
}

//
//  SkinsCounter.IViewHandler.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 12.04.2025.
//

public protocol ISkinsCounterViewHandler {
    var skinsCounterViewHandlerHoleNumber: Int { get }
    var skinsCounterViewHandlerSkinsCount: Int { get }
    var skinsCounterViewHandlerStrokeCount: Int { get set }
    
    func skinsCounterViewHandlerOnNextHoleTapped()
}


public protocol ISkinsCounterViewHandler {
    var skinsCounterViewHandlerHoleNumber: Int { get }
    var skinsCounterViewHandlerSkinsCount: Int { get }
    var skinsCounterViewHandlerStrokeCount: Int { get }
    
    func skinsCounterViewHandlerOnViewDidload()
    func skinsCounterViewHandlerOnNextHoleTapped()
    func skinsCounterViewHandlerOnResetTapped()
    func skinsCounterViewHandlerOnNewStroke(value: Int)
}

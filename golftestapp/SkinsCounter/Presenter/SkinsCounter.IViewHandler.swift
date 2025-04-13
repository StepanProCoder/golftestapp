
public protocol ISkinsCounterViewHandler {
    var skinsCounterViewHandlerHoleNumber: Int { get }
    var skinsCounterViewHandlerSkinsCount: Int { get }
    var skinsCounterViewHandlerStrokeCount: Int { get }
    
    func skinsCounterViewHandlerOnViewDidload()
    func skinsCounterViewHandlerOnNextHoleTapped()
    func skinsCounterViewHandlerOnNewStroke(value: Int)
}

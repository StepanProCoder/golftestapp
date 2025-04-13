public protocol IScoreBoardViewHandler {
    var scoreBoardViewHandlerLeaderBoard: [SkinsTableEntry] { get }
    var scoreBoardViewHandlerHoleScores: [HoleScore] { get }
    var scoreBoardViewHandlerWinner: SkinsTableEntry? { get }
    
    func scoreBoardViewHandlerOnUpdateData()
}

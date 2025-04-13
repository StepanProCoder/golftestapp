
extension ScoreBoard.Presenter: SkinsCounter.CalculatorDelegate {
    public func skinsCounterCalculatorDelegateOnResetSession() {
        skinsCounterCalculatorDelegateHoleNumber = 1
        skinsCounterCalculatorDelegateStrokeCount = 0
        skinsCounterCalculatorDelegateSkinsCount = 1
        scoreBoardViewHandlerLeaderBoard = []
        scoreBoardViewHandlerHoleScores = []
        scoreBoardViewHandlerWinner = nil
    }
}


extension ScoreBoard.Presenter: ScoreBoard.IViewHandler {
    public func scoreBoardViewHandlerOnUpdateData() {
        guard let interactor else { return }
        let ownerPlayerScore = [PlayerScore(playerName: "Me", strokes: skinsCounterCalculatorDelegateStrokeCount)]
        let otherPlayersScore = interactor.scoreBoardInteractorPullOtherPlayersScore()
        let currentPlayersScore: [PlayerScore] = otherPlayersScore + ownerPlayerScore
        
        let currentHoleScore = interactor.scoreBoardInteractorCalculateHoleScore(from: currentPlayersScore, previousHole: scoreBoardViewHandlerHoleScores.last)
        skinsCounterCalculatorDelegateSkinsCount = (currentHoleScore.isSkinCarried ? (currentHoleScore.carryCountBefore + 1) : 0) + 1
        
        scoreBoardViewHandlerHoleScores += [currentHoleScore]
        scoreBoardViewHandlerLeaderBoard = interactor.scoreBoardInteractorBuildLeaderboard(from: scoreBoardViewHandlerHoleScores)
        scoreBoardViewHandlerWinner = skinsCounterCalculatorDelegateHoleNumber > 18 ? scoreBoardViewHandlerLeaderBoard.first : nil
    }
}


public class ScoreBoardPresenter {
    public var view: ScoreBoard.IView?
    public var interactor: ScoreBoard.IInteractor?
    
    public var scoreBoardViewHandlerLeaderBoard: [SkinsTableEntry] = []
    public var scoreBoardViewHandlerHoleScores: [HoleScore] = []
    public var scoreBoardViewHandlerWinner: SkinsTableEntry?
    
    public var skinsCounterCalculatorDelegateHoleNumber: Int = 1 {
        didSet {
            scoreBoardViewHandlerOnUpdateData()
            view?.scoreBoardViewReloadData()
        }
    }
    public var skinsCounterCalculatorDelegateStrokeCount: Int = 0
    public var skinsCounterCalculatorDelegateSkinsCount: Int = 1
}

//
//  ScoreBoard.Interactor+IInteractor.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 13.04.2025.
//

extension ScoreBoard.Interactor: ScoreBoard.IInteractor {
    public func scoreBoardInteractorCalculateHoleScore(from currentPlayersScore: [PlayerScore], previousHole: HoleScore?) -> HoleScore {
        let holeNumber = (previousHole?.holeNumber ?? 0) + 1
        let carryCount = previousHole?.isSkinCarried == true ? (previousHole?.carryCountBefore ?? 0) + 1 : 0

        let winner = determineWinner(from: currentPlayersScore)

        if let winner = winner {
            let skinsWon = max(1, carryCount + 1)
            return HoleScore(
                holeNumber: holeNumber,
                playerScores: currentPlayersScore,
                skinOwner: winner,
                isSkinCarried: false,
                skinsWon: skinsWon,
                carryCountBefore: carryCount
            )
        } else {
            return HoleScore(
                holeNumber: holeNumber,
                playerScores: currentPlayersScore,
                skinOwner: nil,
                isSkinCarried: true,
                skinsWon: 0,
                carryCountBefore: carryCount
            )
        }
    }
    
    public func scoreBoardInteractorBuildLeaderboard(from holeScores: [HoleScore]) -> [SkinsTableEntry] {
        var leaderboardDict: [String: SkinsTableEntry] = [:]

        for hole in holeScores {
            for player in hole.playerScores {
                if leaderboardDict[player.playerName] == nil {
                    leaderboardDict[player.playerName] = SkinsTableEntry(playerName: player.playerName, skinsWon: 0, carryCount: 0)
                }
            }

            if let skinOwner = hole.skinOwner {
                leaderboardDict[skinOwner]?.skinsWon += hole.skinsWon
            }

            if hole.isSkinCarried {
                for player in hole.playerScores {
                    leaderboardDict[player.playerName]?.carryCount += 1
                }
            }
        }

        return leaderboardDict.values.sorted { $0.skinsWon > $1.skinsWon }
    }
    
    public func scoreBoardInteractorPullOtherPlayersScore() -> [PlayerScore] {
        return pullService?.scoreBoardOtherPlayersPullServiceFetch() ?? []
    }
}

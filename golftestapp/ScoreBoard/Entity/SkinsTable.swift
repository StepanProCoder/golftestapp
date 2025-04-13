import Foundation

struct SkinsTableEntry {
    let playerName: String
    var skinsWon: Int
    var carryCount: Int
    
    mutating func incrementSkins() {
        skinsWon += 1
    }
    
    mutating func incrementCarry() {
        carryCount += 1
    }
}

class SkinsTable {
    private var entries: [String: SkinsTableEntry] = [:]
    
    func addPlayer(_ playerName: String) {
        if entries[playerName] == nil {
            entries[playerName] = SkinsTableEntry(playerName: playerName, skinsWon: 0, carryCount: 0)
        }
    }
    
    func updateForHole(holeScore: HoleScore) {
        if let skinOwner = holeScore.skinOwner {
            entries[skinOwner]?.incrementSkins()
        }
        
        if holeScore.isSkinCarried {
            for player in holeScore.playerScores {
                entries[player.playerName]?.incrementCarry()
            }
        }
    }
    
    func getSortedEntries() -> [SkinsTableEntry] {
        return entries.values.sorted { $0.skinsWon > $1.skinsWon }
    }
    
    func getWinner() -> SkinsTableEntry? {
        return getSortedEntries().first
    }
}

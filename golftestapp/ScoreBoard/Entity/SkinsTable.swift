public struct SkinsTableEntry {
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

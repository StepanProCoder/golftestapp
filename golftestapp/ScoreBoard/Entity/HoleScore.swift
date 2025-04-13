//
//  HoleScore.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 12.04.2025.
//

struct HoleScore {
    let holeNumber: Int
    let playerScores: [PlayerScore]
    let skinOwner: String?
    let isSkinCarried: Bool
    let skinsWon: Int
    let carryCountBefore: Int 
}

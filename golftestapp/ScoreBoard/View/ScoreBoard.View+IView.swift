//
//  ScoreBoard.View+IView.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 13.04.2025.
//

extension ScoreBoard.View: ScoreBoard.IView {
    public func scoreBoardViewReloadData() {
        tableView.reloadData()
    }
}

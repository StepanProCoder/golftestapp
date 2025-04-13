//
//  SkinsCounter.Router+IRouter.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 13.04.2025.
//

import Foundation
import UIKit

extension SkinsCounter.Router: SkinsCounter.IRouter {
    public func skinsCounterRouterPresentScoreBoard() {
        guard let modalViewController else { return }
            
        let minimalDetent = UISheetPresentationController.Detent.custom { context in
            return 120
        }
            
        if let sheet = modalViewController.sheetPresentationController {
            sheet.detents = [minimalDetent, .large()]
            sheet.selectedDetentIdentifier = minimalDetent.identifier
            sheet.prefersGrabberVisible = true
                
            sheet.largestUndimmedDetentIdentifier = .large
            modalViewController.isModalInPresentation = true
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        }
            
        modalViewController.modalPresentationStyle = .overCurrentContext
            
        parentViewController?.present(modalViewController, animated: true)
    }
    
    public func skinsCounterRouterExtendScoreBoard() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.modalViewController?.sheetPresentationController?.animateChanges {
                self?.modalViewController?.sheetPresentationController?.selectedDetentIdentifier = .large
            }
        }
    }
}

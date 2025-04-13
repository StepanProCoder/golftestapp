//
//  PortraitNavigationController.swift
//  golftestapp
//
//  Created by Степан Тлеубаев  on 14.04.2025.
//

import UIKit

class PortraitNavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}

//
//  KeyframeCoordinator.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 24/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

class KeyframeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var currentView: UIViewController?
    
    let window: UIWindow
    let previousView: UIViewController
    
    
    init(window: UIWindow, parentCoordinator: Coordinator, previousView: UIViewController) {
        self.window = window
        self.parentCoordinator = parentCoordinator
        self.previousView = previousView
    }
    
    func start() {
        self.currentView = KeyframeView(coordinator: self)
        self.previousView.present(self.currentView!, animated: true, completion: nil)
    }
    
    private func dismiss() {
        self.currentView?.dismiss(animated: true, completion: {})
    }
}

extension KeyframeCoordinator {
    func handle(_ action: Event) {
        switch action {
        case KeyframeFlow.finish:
            dismiss()
        default:
            dismiss()
        }
    }
}

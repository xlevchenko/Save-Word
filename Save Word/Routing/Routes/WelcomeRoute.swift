//
//  WelcomeRoute.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import UIKit

protocol WelcomeRoute {
    func openWelcomeScreen()
}

extension WelcomeRoute where Self: Router {
    func openWelcomeScreen(with transition: Transition) {
        
        let router = DefaultRouter(rootTransition: transition)
        let viewModel = WelcomeViewModel(router: router)
        let viewController = WelcomeViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        router.root = viewController
        
        route(to: navigationController, as: transition)
    }
    
    func openWelcomeScreen() {
        openWelcomeScreen(with: ModalTransition(isAnimated: true, modalTransitionStyle: .flipHorizontal, modalPresentationStyle: .fullScreen))
    }
}

extension DefaultRouter: WelcomeRoute { }

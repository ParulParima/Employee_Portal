//
//  AppCoordinator.swift
//  EmployeePortal
//
//  Created by ParulParima on 10/31/22.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {
    
    var window: UIWindow
    private(set) var childCoordinator: [BaseCoordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //initialization of navigation controller and integrating it with window
        let navigationController = UINavigationController()
        
       
        let sceneProvider = FeaturesSceneProvider()
        let cryptoListCoordinator  = FeaturesCoordinator(navigationController: navigationController, sceneProvider: sceneProvider)
        childCoordinator.append(cryptoListCoordinator)
        cryptoListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }
    
    
}

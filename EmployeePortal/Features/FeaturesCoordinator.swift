//
//  FeaturesCoordinator.swift
//  EmployeePortal
//
//  Created by ParulParima on 10/31/22.
//

import Foundation
import UIKit

final class FeaturesCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    var sceneProvider: FeaturesSceneProvider
    private(set) var childCoordinator: [BaseCoordinator] = []
    
    init(navigationController: UINavigationController, sceneProvider: FeaturesSceneProvider) {
        self.navigationController = navigationController
        self.sceneProvider = sceneProvider
    }
    
    func start() {
        let viewController = sceneProvider.makeSplashScreenScene()
        viewController.navigator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    func checkStatus() {
        if AppUserDefaults.shared.accessToken == nil {
            let viewController = sceneProvider.makeloginScene()
            viewController.navigator = self
            navigationController.pushViewController(viewController, animated: false)
        }
        else {
            let viewController = sceneProvider.makeDashboardScene()
            viewController.navigator = self
            viewController.navigateBackClosure = { [weak self] in
                self?.navigationController.popViewController(animated: false)
                self?.checkStatus()
            }
            navigationController.pushViewController(viewController, animated: false)
        }
    }
    
    func dashboard() {
        let viewController = sceneProvider.makeDashboardScene()
        viewController.navigator = self
        viewController.navigateBackClosure = { [weak self] in
            self?.navigationController.popViewController(animated: false)
            self?.checkStatus()
        }
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showEmployeeDetails(employeeDetail: ResultEntity) {
        let viewController = sceneProvider.makeEmployeeDetailsScene(employeeDetails: employeeDetail)
        viewController.navigator = self
        viewController.navigateBackClosure = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showProfileFullScreen(image: String) {
        let viewController = sceneProvider.makeProfileFullScreenScene(image: image)
            viewController.modalPresentationStyle = .overCurrentContext
            navigationController.present(viewController, animated: true)
        }
    
    func showSortByScene(delegate: SortByDelegate) {
        let viewController = sceneProvider.makeSortByScene()
        viewController.delegate = delegate
        viewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(viewController, animated: true)
    }
    
    func showFilterByScene(designation: [String], delegate: FilterByDelegate) {
        let viewController = sceneProvider.makeFilterByScene(designation: designation)
        viewController.navigator = self
        viewController.delegate = delegate
        viewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(viewController, animated: true)
    }
    
    func showSalaryScene(delegate: FilterByDelegate) {
        let viewController = sceneProvider.makeSalaryFilterScene()
        viewController.delegate = delegate
        viewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(viewController, animated: true)
    }
    
    func showDesignationScene(designation: [String], delegate: FilterByDelegate) {
        let viewController = sceneProvider.makeDesignationFilterScene(designation: designation)
        viewController.delegate = delegate
        viewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(viewController, animated: true)
    }
}

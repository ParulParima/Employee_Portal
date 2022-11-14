//
//  BaseCoordinator.swift
//  EmployeePortal
//
//  Created by ParulParima on 10/31/22.
//

import Foundation

protocol BaseCoordinator: AnyObject {
    var childCoordinator: [BaseCoordinator] {get}
    func start()
}

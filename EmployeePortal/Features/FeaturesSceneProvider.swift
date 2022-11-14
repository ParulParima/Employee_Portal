//
//  FeaturesSceneProvider.swift
//  EmployeePortal
//
//  Created by ParulParima on 10/31/22.
//

import Foundation
import UIKit

class FeaturesSceneProvider {
    func makeSplashScreenScene() -> SplashScreenViewController {
        let  controller = SplashScreenViewController()
        return controller
    }
    func makeloginScene() -> LoginViewController {
        let viewModel = LoginViewModel()
        let  controller = LoginViewController(viewModel: viewModel)
        return controller
    }
    func makeDashboardScene() -> EmployeeListViewController {
        let vieModel = EmployeeListViewModel()
        let controller = EmployeeListViewController(viewModel: vieModel)
        return controller
    }
    
    func makeEmployeeDetailsScene(employeeDetails: ResultEntity) -> EmployeeDetailsViewController {
        let viewModel = EmployeeDetailsViewModel(employeeDetail: employeeDetails)
        let controller = EmployeeDetailsViewController(viewModel: viewModel)
        return controller        
    }
    
    func makeProfileFullScreenScene(image: String) -> ProfilePictureViewController {
        let viewModel = ProfilePictureViewModel(image: image)
        let controller = ProfilePictureViewController(viewModel: viewModel)
        return controller
    }
    
    func makeSortByScene() -> SortByViewController {
        let controller = SortByViewController()
        return controller
    }
    
    func makeFilterByScene(designation: [String]) -> FilterViewController {
        let viewModel = FilterViewModel(designation: designation)
        let controller = FilterViewController(viewModel: viewModel)
        return controller
    }
    
    func makeDesignationFilterScene(designation: [String]) -> DesignationFilterViewController {
        let viewModel = DesignationFilterViewModel(designation: designation)
        let controller = DesignationFilterViewController(viewModel: viewModel)
        return controller
    }
    
    func makeSalaryFilterScene() -> SalaryFilterViewController {
        let controller = SalaryFilterViewController()
        return controller
    }
}

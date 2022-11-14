//
//  EmployeeListViewModel.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation

class EmployeeListViewModel {
    
    var employeeData: [ResultEntity] = []
    var count = 0
    
    func fetchEmployeeData(completion: @escaping () -> Void) {
        // fetching the data through api call
        EmployeeDetailsService().fetchEmployeeData() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.employeeData = data.results
                self.count = data.count
                completion()
            case let .failure(error):
                print(error)
                completion()
            }
        }
    }
    
}

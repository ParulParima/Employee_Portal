//
//  EmployeeDetailsViewModel.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation


class EmployeeDetailsViewModel {
    var employeeDetail: ResultEntity
    var key: [String] = ["Email", "Phone no.", "Date of Birth", "Designation","Organization",
                         "Status", "Hire Date", "Salary", "Address", "City", "Zip Code", "Country"]
    
    init(employeeDetail: ResultEntity)
    {
        self.employeeDetail = employeeDetail
    }
}

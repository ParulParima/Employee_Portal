//
//  DesignationFilterViewModel.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation

class DesignationFilterViewModel {
    var designation: [String]
    
    init(designation: [String])
    {
        self.designation = designation
        self.designation.insert("All", at: 0)
    }
}

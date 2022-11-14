//
//  ResultEntity.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation

struct ResultEntity {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let dob: String
    let hireDate: String
    let address: String
    let city: String
    let zipCode: String
    let country: String
    let phone: String
    let photo: String?
    let salary: String
    let designation: String
    let organizationName: String
    let status: String
}

extension ResultEntity {
    
    var value: [String]  { return  [email, phone, dob, designation, organizationName, status, hireDate, salary,address, city, zipCode, country] }
    }




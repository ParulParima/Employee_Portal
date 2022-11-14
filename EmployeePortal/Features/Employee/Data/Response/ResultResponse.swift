//
//  ResultResponse.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation

struct ResultResponse: Codable {
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
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case dob
        case hireDate = "hire_date"
        case address
        case city
        case zipCode = "zip_code"
        case country
        case phone
        case photo
        case salary
        case designation
        case organizationName = "organization_name"
        case status
        
    }
}

extension ResultResponse : DomainConvertableType {
    func asDomain() -> ResultEntity {
        ResultEntity(id: id, firstName: firstName, lastName: lastName, email: email, dob: dob, hireDate: hireDate, address: address, city: city, zipCode: zipCode, country: country, phone: phone, photo: photo, salary: salary, designation: designation, organizationName: organizationName, status: status)
    }
}

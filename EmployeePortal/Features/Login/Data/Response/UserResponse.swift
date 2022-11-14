//
//  UserResponse.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation

struct UserResponse: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
    }
}

extension UserResponse: DomainConvertableType {
    func asDomain() -> UserEntity {
        return UserEntity(id: id, firstName: firstName, lastName: lastName, email: email)
    }
}



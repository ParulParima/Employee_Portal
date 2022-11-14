//
//  LoginResponse.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation

struct LoginResponse: Codable {
    let access: String
    let refresh: String
    let user: UserResponse
    
    enum CodingKeys: String, CodingKey {
        case access = "access"
        case refresh = "refresh"
        case user = "user"
    }
}

extension LoginResponse: DomainConvertableType {
    func asDomain() -> LoginEntity {
        return LoginEntity(access: access, refresh: refresh, user: user.asDomain())
    }
}


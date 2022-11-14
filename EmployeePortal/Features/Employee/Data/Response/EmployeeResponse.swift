//
//  EmployeeResponse.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation

struct EmployeeResponse : Codable {
    let count: Int
    let results: [ResultResponse]
}

extension EmployeeResponse: DomainConvertableType {
    func asDomain() -> EmployeeEntity {
        return EmployeeEntity(count: count, results: results.map{ $0.asDomain() })
    }
}


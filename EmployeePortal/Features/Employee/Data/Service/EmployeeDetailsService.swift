//
//  EmployeeDetailsResponse.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation

class EmployeeDetailsService {
    
    func fetchEmployeeData(completion: @escaping (Result<EmployeeEntity, Error>) -> Void) {
        guard let url = URL(string: APIConstant.employeeListURL) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json;charset=utf-8",forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(AppUserDefaults.shared.accessToken!)", forHTTPHeaderField: "Authorization")
        NetworkManager.shared.getApiData(requestURL: urlRequest, completionHandler: { (result : Result<EmployeeResponse, Error>) in completion(result.map {data in return data.asDomain()
            
        })
            
        })
    }
    
    
}

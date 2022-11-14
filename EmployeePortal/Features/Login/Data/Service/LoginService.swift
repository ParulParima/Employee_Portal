//
//  LoginService.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation

class LoginService {
    
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<LoginEntity, Error>) -> Void) {
        guard let url = URL(string: APIConstant.LoginURL ) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
          } catch let error {
            print(error.localizedDescription)
            return
          }
        NetworkManager.shared.postApiData(requestURL: urlRequest, completionHandler: { (result : Result<LoginResponse, Error>) in completion(result.map {data in return data.asDomain()
            
        })
            
        })
    }
    
    
}


//
//  LoginViewModel.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation


class LoginViewModel {
    
    var accessToken: String?
    var error: String?
    
    func loginAuthentication(email:String, password: String, completion: @escaping () -> Void) {
        // fetching the data through api call
        LoginService().loginAuthentication(email: email, password: password) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success(data):
                AppUserDefaults.shared.accessToken = data.access
                completion()
            case let .failure(error):
                self?.error = error.localizedDescription
                completion()
            }
        }
    }
    
}

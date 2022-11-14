//
//  AppUserDefaults.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import Foundation

class AppUserDefaults {
    private let authentication = "authorizationToken"

    static let shared = AppUserDefaults()
    let defaults = UserDefaults.standard
    
    
    var accessToken: String? {
        get { return defaults.string(forKey: authentication) }
        set {
            defaults.set(newValue, forKey: authentication)
            defaults.synchronize()
        }
    }
    
    
    }
    
    

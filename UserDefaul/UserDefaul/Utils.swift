//
//  Utils.swift
//  UserDefaul
//
//  Created by Thiago B Claramunt on 28/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class Utils {
    
    static func saveStringObject(key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    
    static func getStringObject(key: String) -> String? {
        let value = UserDefaults.standard.string(forKey: key)
        return value
    }
    
    static func saveObject(key: String, value: Any) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func getObject(key: String) -> Any? {
        let value = UserDefaults.standard.object(forKey: key)
        return value
    }
    
}

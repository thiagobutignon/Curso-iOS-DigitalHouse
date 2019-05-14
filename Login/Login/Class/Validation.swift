//
//  Validation.swift
//  Login
//
//  Created by Thiago B Claramunt on 13/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

protocol InfoValidate {
    static func emailVerification(email: String) -> Bool
}

class Validation: InfoValidate {
    static func emailVerification(email: String) -> Bool {
        return  NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: email)
    }
    
}

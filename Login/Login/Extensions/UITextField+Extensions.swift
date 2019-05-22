//
//  UITextField+Extensions.swift
//  Login
//
//  Created by Thiago B Claramunt on 14/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit.UITextField

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}

//
//  Validation.swift
//  Login
//
//  Created by Thiago B Claramunt on 13/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

class ValidationError: Error {
    var message: String
    init(_ message: String) {
        self.message = message
    }
}

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
}

enum ValidatorType {
    case email
    case password
    case cpf
}

enum ValidatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .email:
            return EmailValidator()
        case .password:
            return PasswordValidator()
        case .cpf:
            return CPFValidator()
        }
    }
}
struct PasswordValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value != "" else { throw ValidationError("Password is required")}
        guard value.count >= 6 else { throw ValidationError("Password must have at least 6 characters")}
        
        do {
            if try NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Password must be more than 6 character, with at least one character and one numeric character")
            }
        } catch {
            throw ValidationError("Password must be more than 6 character, with at least one character and one numeric character")
        }
        return value
    }
}

struct EmailValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {

        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Invalid e-mail address")
            }
        } catch {
            throw ValidationError("Invalid e-mail address")
        }
        return value
    }
}

struct CPFValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        if value.isValidCPF {
            return value
        } else {
            throw ValidationError("Invalid cpf")
        }
    }
}


extension StringProtocol {
    var isValidCPF: Bool {
        let numbers = compactMap({ $0.wholeNumberValue })
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        func digitCalculator(_ slice: ArraySlice<Int>) -> Int {
            var number = slice.count + 2
            let digit = 11 - slice.reduce(into: 0) {
                number -= 1
                $0 += $1 * number
                } % 11
            return digit % 10
        }
        let dv1 = digitCalculator(numbers.prefix(9))
        let dv2 = digitCalculator(numbers.prefix(10))
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
}

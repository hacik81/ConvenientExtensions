//
//  String+Extensions.swift
//  PaybackSwiftUI
//
//  Created by Sebastian Hat on 09/08/2022.
//

import Foundation

public extension String {
    
    /// Checks if email format is valid.
    ///  - Returns: true if validation is successful.
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    var isNotValidEmail: Bool {
        isValidEmail == false
    }
    
    private static let slugSafeCharacters = CharacterSet(
        charactersIn: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-")
    
    func convertedToSlug() -> String? {
        if let latin = self.applyingTransform(StringTransform("Any-Latin; Latin-ASCII; Lower;"), reverse: false) {
            let urlComponents = latin.components(separatedBy: String.slugSafeCharacters.inverted)
            let result = urlComponents.filter { $0 != "" }.joined(separator: "-")
            
            if result.count > 0 {
                return result
            }
        }
            return nil
    }
    
    /// Limits String characters to number provided
    /// - Parameter number: Int value that should be a new character counts for a String
    /// - Returns: Modified string with characters count of provided value or a original String if a number value is higher or equal to original String
    @discardableResult mutating func limitCharacters(to number: Int) -> String {
        if self.count > number {
            let charactersCount = self.count - number
            self.removeLast(charactersCount)
            return self
        } else {
            return self
        }
    }
}

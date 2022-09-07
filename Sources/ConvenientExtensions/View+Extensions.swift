//
//  View+Extensions.swift
//  PaybackSwiftUI
//
//  Created by Sebastian Hat on 02/09/2022.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    
    /// Hides keyboard using onTapGesture on a View
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(
            resign, to: nil, from: nil, for: nil)
    }
}

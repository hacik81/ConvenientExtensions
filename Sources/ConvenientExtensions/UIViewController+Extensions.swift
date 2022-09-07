//
//  UIViewControllerExtension.swift
//  JobDone
//
//  Created by Sebastian Hat on 20/11/2018.
//  Copyright © 2018 Sebastian Hat. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    /// Uses gesture recognizer to dismiss keyboard when tapping outside text input field.
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

}

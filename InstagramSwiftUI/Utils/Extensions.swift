//
//  Extensions.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 08/04/21.
//

import Foundation
import UIKit

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

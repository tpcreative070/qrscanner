//
//  ApplicationExtension.swift
//  qrscanner
//
//  Created by phong on 30/11/2023.
//

import Foundation
import SwiftUI


extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

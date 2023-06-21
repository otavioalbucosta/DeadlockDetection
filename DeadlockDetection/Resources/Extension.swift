//
//  Extension.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 19/06/23.
//

import Foundation
import SwiftUI

extension Color {
    static func randomColor() -> Color {
        return Color(red: .random(in: 0.5...1), green: .random(in: 0...1), blue: .random(in: 0.5...1))
    }
}


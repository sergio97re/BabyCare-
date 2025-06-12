//
//  TextFieldModifier.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 03/06/2025.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .autocorrectionDisabled(true)
            .padding()
            .background(Color.gray.opacity(0.03))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray)
            )
    }
}

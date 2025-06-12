//
//  LoginViewModel.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 08/05/2025.
//

import Foundation

@Observable
class LoginViewModel {
    var email: String = ""
    var password: String = ""
    
    func signIn() async throws {
        AuthService.shared.login(email: email, password: password)
    }
}

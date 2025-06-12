//
//  RegisterViewModel.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 03/06/2025.
//

import Observation
import Foundation

@Observable
@MainActor
class RegisterViewModel {
    var email = ""
    var password = ""
    var username = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
    }
}

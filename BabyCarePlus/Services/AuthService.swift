//
//  AuthService.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 20/05/2025.
//

import Observation
import Foundation
import FirebaseAuth

@Observable
@MainActor
final class AuthService {
    static let shared = AuthService()
    
    var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        }catch {
            print("DEBUG: Error al registrar usuario: \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        
    }
}

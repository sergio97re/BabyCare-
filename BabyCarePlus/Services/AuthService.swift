//
//  AuthService.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 20/05/2025.
//

import Observation
import Foundation
import FirebaseAuth
import FirebaseFirestore
import Firebase

@Observable
final class AuthService {
    static let shared = AuthService()
    
    var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }catch {
            print("DEBUG: Error en el login del usuario: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        }catch {
            print("DEBUG: Error al registrar usuario: \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = UserParent(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        
    }
    
    
}

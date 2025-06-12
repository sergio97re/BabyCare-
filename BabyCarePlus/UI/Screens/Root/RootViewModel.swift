//
//  RootViewModel.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 08/05/2025.
//

import Observation
import Foundation
import FirebaseAuth
import Firebase
import Combine

@Observable
@MainActor
final class RootViewModel {
    var service = AuthService.shared
    var userSession: FirebaseAuth.User? {
        service.userSession
    }
}

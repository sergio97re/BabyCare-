//
//  UserParent.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 12/06/2025.
//

import Foundation

struct UserParent: Identifiable, Hashable, Codable {
    var id: String
    var username: String
    var email: String
    var profileImageUrl: String?
    var fullName: String?
    var age: Int?
    var typeParent: String?
}

extension UserParent {
    static var MOCK_PARENT: [UserParent] = [
        .init(id: NSUUID().uuidString, username: "Sergio", email: "sergioreina@gmail.com", profileImageUrl: "https://via.placeholder.com/150", fullName: "Sergio Reina Montes", age: 28, typeParent: "Padre"),
        .init(id: NSUUID().uuidString, username: "Águeda", email: "aguedajim@gmail.com", profileImageUrl: "https://via.placeholder.com/150", fullName: "Águeda Jimenez", age: 25, typeParent: "Madre"),
        .init(id: NSUUID().uuidString, username: "David", email: "davidreina@gmail.com", profileImageUrl: "https://via.placeholder.com/150", fullName: "David Reina Montes", age: 34, typeParent: "Padre"),
        .init(id: NSUUID().uuidString, username: "Marina", email: "marinaosuna@gmail.com", profileImageUrl: "https://via.placeholder.com/150", fullName: "Marina Osuna", age: 31, typeParent: "Madre"),
        .init(id: NSUUID().uuidString, username: "Sebas", email: "sebasreina@gmail.com", profileImageUrl: "https://via.placeholder.com/150", fullName: "Sebas Reina", age: 60, typeParent: "Abuelo"),
        .init(id: NSUUID().uuidString, username: "Loli", email: "loli@gmail.com", profileImageUrl: "https://via.placeholder.com/150", fullName: "Loli Montes", age: 61, typeParent: "Abuela")
        ]
}

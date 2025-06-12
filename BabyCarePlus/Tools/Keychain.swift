//
//  Keychain.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 08/05/2025.
//

import Foundation
import KeychainSwift

//Guardamos en Keychain
func saveKC(key: String, value: String) -> Bool {
    //Convertimos cadena value en data con codificacion utf8
    if let data = value.data(using: .utf8) {
        let kc = KeychainSwift()
        return kc.set(data, forKey: key)
    }else {
        //Si no desempaqueta...
        return false
    }
}


//Leemos del Keychain
func loadKC(key: String) -> String? {
    if let data = KeychainSwift().get(key) {
        return data
    }else {
        return ""
    }
}


//Borramos del Keychain
func deleteKC(key: String) -> Bool {
    KeychainSwift().delete(key)
}

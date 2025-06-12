//
//  StatusModel.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 08/05/2025.
//

import Foundation

enum Status {
    case login, loading, loaded, register, error(error: String)
}

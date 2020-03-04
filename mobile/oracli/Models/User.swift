//
//  User.swift
//  oracli
//
//  Created by Anika Morris on 2/15/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

struct User:Codable {
    
    let name: String
    let age: Int
    let gender: String
    let is_mentor: Bool
    let email: String
    let password: String
    
}

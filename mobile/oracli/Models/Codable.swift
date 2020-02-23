//
//  Codable.swift
//  oracli
//
//  Created by Anika Morris on 2/23/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

struct Login:Codable {
    let email: String
    let password: String
}

struct Update:Codable {
    let token: String
    let fieldToUpdate: String
    let update: String
}



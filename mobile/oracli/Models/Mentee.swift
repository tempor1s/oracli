//
//  Mentee.swift
//  oracli
//
//  Created by Anika Morris on 2/7/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

struct Mentee:Codable {
    
    let name: String
    let age: Int
    let gender: String
    let email: String
    
    let token: String?
    let interests: String?
    let whyMentor: String?
    let about: String?
    let mentor: Mentor?
}

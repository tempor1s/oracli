//
//  JSONUser.swift
//  oracli
//
//  Created by Anika Morris on 3/3/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

struct Mentees:Codable {
    
    struct MenteeUser:Codable {
        
        let name: String
        let age: Int
        let gender: String
        let is_mentor: Bool
        let email: String
        
        var mentor: Mentor?
        var about: String?
        var interests: String?
        var why_mentor: String?
        var job_experience: String?
        
        struct Password:Codable {
            var binary: String
            var type: String
        }
        
        struct ID:Codable {
            var oid: String
            var token: String
        }
        
        // TODO: create extension with enum to make sure binary, type, and oid can be parsed by JSON decoder
        // TODO: figure out a solution for the mentor problem
    }
    var mentees: [MenteeUser]
}

struct JSONUser:Codable {
    
    let name: String
    let age: Int
    let gender: String
    let is_mentor: Bool
    let email: String
    
    var mentor: Mentor?
    var about: String?
    var interests: String?
    var why_mentor: String?
    var job_experience: String?
    
    struct Password:Codable {
        var binary: String
        var type: String
    }
    
    struct ID:Codable {
        var oid: String
        var token: String
    }
    
    // TODO: create extension with enum to make sure binary, type, and oid can be parsed by JSON decoder
    // TODO: figure out a solution for the mentor problem
}

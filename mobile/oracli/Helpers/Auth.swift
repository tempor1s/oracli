//
//  Auth.swift
//  oracli
//
//  Created by Anika Morris on 2/17/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

func createUser(user: User) -> String {
    var token: String = ""
    let url = URL(string: "https://oracli.dev.benlafferty.me/register")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    guard let uploadData = try? JSONEncoder().encode(user) else { return "Can't encode user as JSON" }

    let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
        if let error = error {
            print ("error: \(error)")
            return
        }
        guard let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode) else {
            print ("server error")
            return
        }
        if let mimeType = response.mimeType,
            mimeType == "application/json",
            let data = data {
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return}
            if let dictionary = json as? [String:String] {
                if let value = dictionary["token"] {
                    token = value
                }
            }
            print ("got token: \(token)")
        }
    }
    task.resume()
    return token
}

func updateUser(userID: String, fieldToUpdate: String, update: Any) {
    let url = URL(string: "https://oracli.dev.benlafferty.me/user")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue(userID, forHTTPHeaderField: "Auth")
}

func getUser(token: String) -> String {
     return "User"
}

func allMentees() -> [String] {
    return ["mentee", "mentee"]
}

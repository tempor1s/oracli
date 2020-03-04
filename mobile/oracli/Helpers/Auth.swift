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
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
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

func login(login: Login, completionHandler: @escaping (String) -> Void) {
    let url = URL(string: "https://oracli.dev.benlafferty.me/login")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    guard let loginData = try? JSONEncoder().encode(login) else { return }
    let task = URLSession.shared.uploadTask(with: request, from: loginData) { data, response, error in
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
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                completionHandler("couldn't serialize json")
                return
            }
            if let dictionary = json as? [String:String] {
                if let message = dictionary["message"] {
                    completionHandler(message)
                } else {
                    completionHandler(dictionary["token"]!)
                }
            }
        }
    }
    task.resume()
}

//func updateUser(update: Update) {
//    let url = URL(string: "https://oracli.dev.benlafferty.me/user")!
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.setValue(userID, forHTTPHeaderField: "Auth")
//
//    guard let uploadData = try? JSONEncoder().encode(update) else { return }
//
//    let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
//        if let error = error {
//            print ("error: \(error)")
//            return
//        }
//        guard let response = response as? HTTPURLResponse,
//            (200...299).contains(response.statusCode) else {
//            print ("server error")
//            return
//        }
//        if let mimeType = response.mimeType,
//            mimeType == "application/json",
//            let data = data {
//            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
//            if let dictionary = json as? [String:String] {
//                if let value = dictionary["token"] {
//                    token = value
//                }
//            }
//            print ("got token: \(token)")
//        }
//    }
//    task.resume()
//}

func fetchUser(token: String, completionHandler: @escaping (Bool?, JSONUser?, Error?) -> Void) {
    let url = URL(string: "https://oracli.dev.benlafferty.me/user")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue(token, forHTTPHeaderField: "Auth")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
        guard let data = data else { return }
        do {
          // parse json data and return it
            let decoder = JSONDecoder()
            let jsonUser = try decoder.decode(JSONUser.self, from: data)
            print(jsonUser)
            if jsonUser.is_mentor {
                completionHandler(true, jsonUser, nil)
            } else {
                completionHandler(false, jsonUser, nil)
            }
        } catch let parseErr {
          print("JSON parsing error!", parseErr)
          completionHandler(nil, nil, parseErr)
        }
    })
    task.resume()
}

func allMentees() -> [String] {
    return ["mentee", "mentee"]
}

//
//  Auth.swift
//  oracli
//
//  Created by Anika Morris on 2/17/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

//creates new mentor or mentee
func createUser(user: User) -> String {
    var token: String = ""
    let url = URL(string: "https://oracli.dev.benlafferty.me/register")!    //flask api url
    var request = URLRequest(url: url)  //creating url request
    request.httpMethod = "POST"         //determines the type of url request
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    //attempts to encode the user data to JSON, throws an error into an optional if unsuccessful and ends the function
    guard let uploadData = try? JSONEncoder().encode(user) else { return "Can't encode user as JSON" }
    //sends the post request to server and gets back error and server response
    let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
        if let error = error {
            print ("error: \(error)")
            return
        }
        //checks server for correct server response code, throws an error and ends if incorrect one is received
        guard let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode) else {
            print ("server error")
            return
        }
        //handles data you recieve from the server
        if let mimeType = response.mimeType,
            mimeType == "application/json",
            let data = data {
            //extracts the data and converts it to json
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

//logs user i
func login(login: Login) -> String {
    var returnValue: String = "1"   //should hold the account token by the end
    let url = URL(string: "https://oracli.dev.benlafferty.me/login")!   //flask api url
    var request = URLRequest(url: url)      //create url request
    request.httpMethod = "POST"             //set url request type
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    //attempts to convert login info to json, throws an error and ends if  unsuccessful
    guard let loginData = try? JSONEncoder().encode(login) else { return "can't encode login" }
    //sends the post request to server and gets back error and server response
    let task = URLSession.shared.uploadTask(with: request, from: loginData) { data, response, error in
        if let error = error {
            print ("error: \(error)")
            return 
        }
        //checks server for correct server response code, throws an error and ends if incorrect one is received
        guard let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode) else {
            print ("server error")
            return
        }

        //handles data you recieve from the server
        if let mimeType = response.mimeType,
            mimeType == "application/json",
            let data = data {
            //extracts the data and converts it to json
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                returnValue = "couldn't serialize json"
                print("couldn't serialize json")
                return
            }
            if let dictionary = json as? [String:String] {
                print("failed getting dictionary")
                if let message = dictionary["message"] {
                    print("failed in data retrieval")
                    returnValue = message
                } else {
                    print("failed the error catcher")
                    returnValue = "it worked dumb bitch"
                }
            }
            print(returnValue)
        }
    }
    task.resume()
    return returnValue
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

func getUser(token: String) -> String {
     return "User"
}

func allMentees() -> [String] {
    return ["mentee", "mentee"]
}

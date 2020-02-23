//
//  Auth.swift
//  oracli
//
//  Created by Anika Morris on 2/17/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

func createUser(user: User) {
    let url = URL(string: "https://oracli.dev.benlafferty.me/register")!    //flask api url
    var request = URLRequest(url: url)  //creating url request
    request.httpMethod = "POST"         //determines the type of url request
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    //atempts to encode the user data to JSON, throws an error into an optional if unsuccessful and ends the function
    guard let uploadData = try? JSONEncoder().encode(user) else { return }
    
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
            let data = data,
            let dataString = String(data: data, encoding: .utf8) {
            print ("got data: \(dataString)")
        }
    }
    task.resume()
}

func updateUser(userID: String, fieldToUpdate: String, update: Any) {
    let url = URL(string: "https://oracli.dev.benlafferty.me/user")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue(userID, forHTTPHeaderField: "Auth")
}

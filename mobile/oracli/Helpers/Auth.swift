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
    let url = URL(string: "https://oracli.dev.benlafferty.me/register")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    guard let uploadData = try? JSONEncoder().encode(user) else { return }

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

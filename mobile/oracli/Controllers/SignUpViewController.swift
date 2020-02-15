//
//  SignUpViewController.swift
//  oracli
//
//  Created by Anika Morris on 2/4/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var mentorSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Register"
        self.navigationItem.leftBarButtonItem?.title = ""
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        guard let age = ageTextField.text else {
            return
        }
        guard let email = emailTextField.text else {
            return
        }
        guard let gender = genderTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        guard let confirmedPassword = confirmPasswordTextField.text else {
            return
        }
        if password == confirmedPassword {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if mentorSegmentedControl.selectedSegmentIndex == 0 {
                let mentee: User = User(name: name, age: Int(age)!, gender: gender, isMentor: false, email: email, password: password)
                createUser(user: mentee)
                let nextVC = storyboard.instantiateViewController(withIdentifier: "MenteeSignUpVC") as! MenteeSignUpViewController
                nextVC.name = name
                nextVC.age = age
                self.navigationController?.pushViewController(nextVC, animated: true)
            } else {
                let mentor: User = User(name: name, age: Int(age)!, gender: gender, isMentor: true, email: email, password: password)
                createUser(user: mentor)
                let nextVC = storyboard.instantiateViewController(withIdentifier: "MentorSignUpVC") as! MentorSignUpViewController
                nextVC.name = name
                nextVC.age = age
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        } else {
            return
        }
    }
    
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
}

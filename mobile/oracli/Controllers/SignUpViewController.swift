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
                let mentee: User = User(name: name, age: Int(age)!, gender: gender,
                                        isMentor: false, email: email, password: password)
                let nextVC = storyboard.instantiateViewController(withIdentifier: "MenteeSignUpVC") as! MenteeSignUpViewController
                nextVC.token = createUser(user: mentee)
                print("token: \(nextVC.token!)")
                self.navigationController?.pushViewController(nextVC, animated: true)
            } else {
                let mentor: User = User(name: name, age: Int(age)!, gender: gender,
                                        isMentor: true, email: email, password: password)
                let nextVC = storyboard.instantiateViewController(withIdentifier: "MentorSignUpVC") as! MentorSignUpViewController
                nextVC.token = createUser(user: mentor)
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        } else {
            return
        }
    }
}

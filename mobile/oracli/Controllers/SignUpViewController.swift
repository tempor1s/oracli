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
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        guard let password = passwordTextField.text else {
            return
        }
        guard let confirmedPassword = confirmPasswordTextField.text else {
            return
        }
        if password == confirmedPassword {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if mentorSegmentedControl.selectedSegmentIndex == 0 {
                let nextVC = storyboard.instantiateViewController(withIdentifier: "MenteeSignUpVC") as! MenteeSignUpViewController
                self.navigationController?.pushViewController(nextVC, animated: true)
            } else {
                let nextVC = storyboard.instantiateViewController(withIdentifier: "MentorSignUpVC") as! MentorSignUpViewController
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        } else {
            return
        }
    }
}

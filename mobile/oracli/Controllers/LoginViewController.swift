//
//  LoginViewController.swift
//  oracli
//
//  Created by Anika Morris on 2/23/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        let loginInfo = Login(email: email, password: password)
        let response = login(login: loginInfo)
        print(response)
    }
}

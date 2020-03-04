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
    
    func showError(withText: String) {
        let errorLabel = UILabel()
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.text = withText
        errorLabel.textAlignment = .center
        errorLabel.textColor = .red
        self.view.addSubview(errorLabel)
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            errorLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            errorLabel.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor)
        ])
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.layer.borderWidth = 1.0;
        self.emailTextField.layer.borderColor = UIColor.black.cgColor
        
        self.passwordTextField.layer.borderWidth = 1.0;
        self.passwordTextField.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        var message: String = ""
        var loading: Bool = true
        
        let loginInfo = Login(email: email, password: password)
        login(login: loginInfo, completionHandler: { response in
            message = response
            loading = false
        })
        
        // TODO: figure out a better way to say "don't run until token is received" than this fuckshit
        while loading {
            print("loading")
        }
        // if response contains a message, show error
        if message == "Incorrect password." || message=="user not found" {
            showError(withText: "Email and password don't match.")
        } else if message != "" {
            // transition to next storyboard
            print(message)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mentorVC = storyboard.instantiateViewController(withIdentifier: "MentorProfileVC") as! MentorProfileViewController
            let menteeVC = storyboard.instantiateViewController(withIdentifier: "MenteeProfileVC") as! MenteeProfileViewController
                                        
            loading = true
            
            fetchUser(token: message, completionHandler: { isMentor, jsonUser, error in
                if let error = error {
                    print(error)
                    return
                }
                guard let isMentor = isMentor else { return }
                guard let user = jsonUser else { return }
                
                if isMentor {
                    mentorVC.mentor = Mentor(name: user.name, age: user.age, gender: user.gender, email: user.email, about: user.about, jobExperience: user.job_experience, areasOfInterest: user.interests, token: nil)
                } else {
                    menteeVC.mentee = Mentee(name: user.name, age: user.age, gender: user.gender, email: user.email, token: nil, interests: user.interests, whyMentor: user.why_mentor, about: user.about, mentor: user.mentor)
                }
                loading = false
            })
            
            while loading {
                print("loading")
            }
            
            guard let _ = menteeVC.mentee else {
                self.navigationController?.pushViewController(mentorVC, animated: true)
                return
            }
            
            self.navigationController?.pushViewController(menteeVC, animated: true)            
        }
    }
}

//
//  MenteeSignUpViewController.swift
//  oracli
//
//  Created by Anika Morris on 2/4/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class MenteeSignUpViewController: UIViewController {
    
    var token: String?
    var name: String?
    var age: String?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var whyMentorTextView: UITextView!
    @IBOutlet weak var interestsTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = name, let age = age {
            nameLabel.text = name
            ageLabel.text = age
        }
        
        aboutTextView.clipsToBounds = true
        self.aboutTextView.layer.borderWidth = 1.0
        self.aboutTextView.layer.borderColor = UIColor.black.cgColor
        aboutTextView.layer.cornerRadius = 5.0
        
        whyMentorTextView.clipsToBounds = true
        whyMentorTextView.layer.cornerRadius = 5.0
        self.whyMentorTextView.layer.borderWidth = 1.0
        self.whyMentorTextView.layer.borderColor = UIColor.black.cgColor
        
        interestsTextField.clipsToBounds = true
        interestsTextField.layer.cornerRadius = 5.0
        self.interestsTextField.layer.borderWidth = 1.0
        self.interestsTextField.layer.borderColor = UIColor.black.cgColor
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        // TODO: make call to server to save updated info
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextVC = storyboard.instantiateViewController(withIdentifier: "WaitingPage")
//        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

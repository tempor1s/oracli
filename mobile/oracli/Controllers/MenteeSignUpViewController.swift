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
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var whyMentorTextView: UITextView!
    @IBOutlet weak var interestsTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextVC = storyboard.instantiateViewController(withIdentifier: "WaitingPage")
//        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

//
//  MentorSignUpViewController.swift
//  oracli
//
//  Created by Anika Morris on 2/4/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class MentorSignUpViewController: UIViewController {
    
    var token: String?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var jobExperienceTextView: UITextView!
    @IBOutlet weak var skillsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.aboutTextView.layer.borderWidth = 1.0;
        self.aboutTextView.layer.borderColor = UIColor.black.cgColor
        
        self.jobExperienceTextView.layer.borderWidth = 1.0;
        self.jobExperienceTextView.layer.borderColor = UIColor.black.cgColor
        
        self.skillsTextView.layer.borderWidth = 1.0;
        self.skillsTextView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nc = self.navigationController {
            let nextVC = storyboard.instantiateViewController(withIdentifier: "MenteeListTVC") as! MenteeTableViewController
            nc.pushViewController(nextVC, animated: true)
        }
    }
}

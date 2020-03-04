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
    var name: String?
    var age: String?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var jobExperienceTextView: UITextView!
    @IBOutlet weak var skillsTextView: UITextView!
    
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
        
        jobExperienceTextView.clipsToBounds = true
        jobExperienceTextView.layer.cornerRadius = 5.0
        self.jobExperienceTextView.layer.borderWidth = 1.0;
        self.jobExperienceTextView.layer.borderColor = UIColor.black.cgColor
        
        skillsTextView.clipsToBounds = true
        skillsTextView.layer.cornerRadius = 5.0
        self.skillsTextView.layer.borderWidth = 1.0;
        self.skillsTextView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var loading: Bool = true
        
        availableMentees(token: self.token!, completionHandler: { menteesList, error in
            print("got mentees")
            loading = false
        })
        
        while loading {
            print("loading")
        }
        
        let nextVC = storyboard.instantiateViewController(withIdentifier: "MenteeListTVC") as! MenteeTableViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
}

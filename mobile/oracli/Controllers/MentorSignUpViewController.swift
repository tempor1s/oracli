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
    

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UIStackView!
    @IBOutlet weak var ageLabel: UIStackView!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var jobExperienceTextView: UITextView!
    @IBOutlet weak var skillsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nc = self.navigationController {
            let nextVC = storyboard.instantiateViewController(withIdentifier: "MenteeListTVC") as! MenteeTableViewController
            nc.pushViewController(nextVC, animated: true)
        }
    }
}

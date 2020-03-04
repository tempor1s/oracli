//
//  MenteeProfileViewController.swift
//  oracli
//
//  Created by Anika Morris on 3/3/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class MenteeProfileViewController: UIViewController {
    
    var mentee: Mentee?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var interestsLabel: UILabel!
    @IBOutlet weak var whyMentorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Mentee: \(String(describing: mentee))")
        if let mentee = self.mentee {
            nameLabel.text = mentee.name
            ageLabel.text = String(mentee.age)
            aboutLabel.text = mentee.about ?? "About"
            interestsLabel.text = mentee.interests ?? "Areas of Interest"
            whyMentorLabel.text = mentee.whyMentor ?? "Why do you want a mentor?"
        }
    }
}

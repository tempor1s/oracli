//
//  MentorProfileViewController.swift
//  oracli
//
//  Created by Anika Morris on 3/3/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class MentorProfileViewController: UIViewController {
    
    var mentor: Mentor?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var interestsLabel: UILabel!
    @IBOutlet weak var jobExperienceLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var selectMenteeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Mentor: \(String(describing: mentor))")
    }
}

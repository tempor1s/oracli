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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Mentor: \(String(describing: mentor))")
    }
}

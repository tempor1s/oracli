//
//  WaitingViewController.swift
//  oracli
//
//  Created by Anika Morris on 2/10/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class WaitingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // if mentee is matched, load nextVC with mentor data and segue
        // if not, segue to mentee's profile (with edit and logout) and dismiss previous VCs
    }
}

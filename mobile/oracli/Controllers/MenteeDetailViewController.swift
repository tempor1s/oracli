//
//  MenteeDetailViewController.swift
//  oracli
//
//  Created by Anika Morris on 2/10/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class MenteeDetailViewController: UIViewController {
    
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectMenteeTapped(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        print("selected")
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  MenteeTableViewController.swift
//  oracli
//
//  Created by Anika Morris on 2/5/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class MenteeTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select a mentee"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    // set tableView cell content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenteeCell", for: indexPath) as! MenteeTableViewCell
        
        // retrieve product at index 'row'
//        let product = products[indexPath.row]
        
        return cell
    }
}

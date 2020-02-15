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

    
    let sampleData: [(name: String, areasOfInterest: String)] = [
        ("akfdj", "The"),
        ("afdkj", "The quick"),
        ("adfklj", "The quick brown"),
        ("adfklj", "The quick brown fox"),
        ("adfklj", "The quick brown fox jumps The quick brown fox jumps over the lazy dog apostrophe-never-again"),
        ("adfklj", "The quick brown fox jumps over"),
        ("adfklj", "The quick brown fox jumps over the"),
        ("adfklj", "The quick brown fox jumps over the lazy"),
        ("adfklj", "The quick brown fox jumps over the lazy dog"),
        ("adfklj", "The quick brown fox jumps over the lazy dog apostrophe-never-again")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select a mentee"
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    // set tableView cell content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenteeCell", for: indexPath) as! MenteeTableViewCell
        
        if cell.matched == true {
            cell.backgroundColor = .systemGreen
        }
        
        let text = sampleData[indexPath.row]
        cell.nameLabel.text = text.0
        cell.areasOfInterestLabel.text = text.1
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }

        if identifier == "toMenteeDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let destination = segue.destination as! MenteeDetailViewController
            destination.indexPath = indexPath
        }
    }
    

}

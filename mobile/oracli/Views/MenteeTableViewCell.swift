//
//  MenteeTableViewCell.swift
//  oracli
//
//  Created by Anika Morris on 2/5/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class MenteeTableViewCell: UITableViewCell {
    
    let nameLabel = makeLabel()
    let areasOfInterestLabel = makeLabel()
    var matched: Bool = false
    
    private static func makeLabel() -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
        return label
    }
    
    private static func makeLabelWithText(text: String) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        
        label.numberOfLines = 0
        return label
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "MenteeCell")
        setUpLabelsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpLabelsAndConstraints()
    }
    
    private func setUpLabelsAndConstraints() {
        
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.adjustsFontForContentSizeCategory = true
        
        guard let palatino = UIFont(name: "Palatino", size: 18) else {
            fatalError("""
                Failed to load the "Palatino" font.
                Since this font is included with all versions of iOS that support Dynamic Type, verify that the spelling and casing is correct.
                """
            )
        }
        areasOfInterestLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: palatino)
        areasOfInterestLabel.adjustsFontForContentSizeCategory = true

        contentView.addSubview(areasOfInterestLabel)
        contentView.addSubview(nameLabel)
        
        nameLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        
        areasOfInterestLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        areasOfInterestLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true

        nameLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.layoutMarginsGuide.topAnchor, multiplier: 1).isActive = true
        
        contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: areasOfInterestLabel.lastBaselineAnchor, multiplier: 1).isActive = true
        
        areasOfInterestLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: nameLabel.lastBaselineAnchor, multiplier: 1).isActive = true
    }
}

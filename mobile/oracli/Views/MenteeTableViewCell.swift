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
    
    let nameLabel = makeLabel(withText: "Name")
    let areasOfInterestLabel = makeLabel(withText: "Areas of Interest")
    
    private static func makeLabel(withText: String) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = withText
        
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
        /*
         The headline label uses the preferred, default `headline` font. This font is already scaled appropriately and supports Dynamic Type.
         All that's needed to have the label automatically adjust this font, is to enable `adjustsFontForContentSizeCategory`.
         */
        //nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.adjustsFontForContentSizeCategory = true
        
        /*
         The body label uses a non-default system font. To make this font support Dynamic Type - and scale it to the current content size - the
         "un-scaled" font is used to create a scaled version that uses the `.body` text style information.
         With this scaled font variant, the label can be configured to make automatic adjustments when the content size changes.
         */
        guard let palatino = UIFont(name: "Palatino", size: 18) else {
            fatalError("""
                Failed to load the "Palatino" font.
                Since this font is included with all versions of iOS that support Dynamic Type, verify that the spelling and casing is correct.
                """
            )
        }
        areasOfInterestLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: palatino)
        areasOfInterestLabel.adjustsFontForContentSizeCategory = true

        /*
         Views that make up the cell's "content" are added to its `contentView`, rather than as top level subviews of the cell, so that they are
         positioned appropriately as the cell transitions into and out of editing mode.
         */
        contentView.addSubview(areasOfInterestLabel)
        contentView.addSubview(nameLabel)
        
        /*
         To have both labels extend the full width of the cell (within default margins); one label's leading and trailing anchors are constrained
         to the corresponding anchors of the cells `contentView` and the other label is constrained to align its leading and trailing anchors with
         the first one.
         */
        nameLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        
        areasOfInterestLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        areasOfInterestLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true

        /*
         To achieve a layout that looks good at all content sizes, the spacing between elements should adjust along with the content.
         
         Since the appropriate spacing around text depends on properties of the font being used; the first baseline of the headline label is
         constrained to use a system spacing to the top of the `contentView`, rather than a regular top-anchor to top-anchor constraint.
         
         Similarly, the _last_ baseline of the body label is constrained to use a system spacing to the bottom of the `contentView`, rather than
         a bottom-anchor to bottom-anchor constraint.
         
         Since either of the two labels could wrap to multiple lines; the _last_ baseline of the top (headline) label constrained to use a system
         spacing to the _first_ baseline of the bottom (body) label.
         */
        nameLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: contentView.layoutMarginsGuide.topAnchor, multiplier: 1).isActive = true
        
        contentView.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: areasOfInterestLabel.lastBaselineAnchor, multiplier: 1).isActive = true
        
        areasOfInterestLabel.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: nameLabel.lastBaselineAnchor, multiplier: 1).isActive = true
    }
}

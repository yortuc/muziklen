//
//  MArtistsTableViewCell.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 08/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

class MArtistsTableViewCell: UITableViewCell {

    var lblName: UILabel
    var lblFollowersCount: UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        lblName = UILabel()
        lblName.translatesAutoresizingMaskIntoConstraints = false
        
        lblFollowersCount = UILabel()
        lblFollowersCount.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(lblName)
        addSubview(lblFollowersCount)
        
        let views = ["name": lblName, "followersCount": lblFollowersCount]
        var layoutConstraints = [NSLayoutConstraint]()
        
        if #available(iOS 9.0, *) {
            layoutConstraints.append(lblName.centerXAnchor.constraintEqualToAnchor(centerXAnchor))
            layoutConstraints.append(lblName.centerYAnchor.constraintEqualToAnchor(centerYAnchor))
        } else {
            // Fallback on earlier versions
        }
        
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("[followersCount]-|", options: [], metrics: nil, views: views)
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:[followersCount]|", options: [], metrics: nil, views: views)
        
        NSLayoutConstraint.activateConstraints(layoutConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

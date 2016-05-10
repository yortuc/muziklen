//
//  MArtistsTableViewCell.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 08/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

class MArtistListCell: UITableViewCell {
    
    @IBOutlet weak var imgArtist: UIImageView!
    
    @IBOutlet weak var constImgArtistHeight: NSLayoutConstraint!
    
    @IBOutlet weak var constImgArtistWidth: NSLayoutConstraint!
    
    @IBOutlet weak var lblArtistTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.constImgArtistWidth.constant = App.UI.artistImageSize
        self.constImgArtistHeight.constant = App.UI.artistImageSize
        
        self.imgArtist.layer.cornerRadius = App.UI.artistCornerRadius
        self.imgArtist.clipsToBounds = true
        
        self.accessoryType = .DisclosureIndicator
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

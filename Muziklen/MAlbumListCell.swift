//
//  MAlbumListCell.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 10/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

class MAlbumListCell: UITableViewCell {

    @IBOutlet weak var imgAlbumCover: UIImageView!
    
    @IBOutlet weak var lblAlbumTitle: UILabel!
    
    @IBOutlet weak var lblAlbumSubInfo: UILabel!
    
    @IBOutlet weak var constImgAlbumHeight: NSLayoutConstraint!
    
    @IBOutlet weak var constAlbumWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.constAlbumWidth.constant = App.UI.artistImageSize
        self.constImgAlbumHeight.constant = App.UI.artistImageSize
        self.imgAlbumCover.layer.cornerRadius = App.UI.artistCornerRadius
        self.imgAlbumCover.clipsToBounds = true
        
        self.accessoryType = .DisclosureIndicator
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

//
//  MSongListCell.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 10/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

class MTrackListCell: UITableViewCell {

    @IBOutlet weak var lblSongTitle: UILabel!
    
    @IBOutlet weak var lblSongSubInfo: UILabel!
    
    @IBOutlet weak var btnSongContextMenu: UIButton!
    
    @IBAction func onSongContextMenu(sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

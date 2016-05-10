//
//  ArtistsListDataProvider.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 05/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

class ArtistsListDataProvider: NSObject, ListDataProvider {

    private let cellIdentifier = "Cell"
    
    private var artists = [Artist]()
    
    func registerCellsForTableView(tableView: UITableView) {
        // tableView.registerClass(MArtistsTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)

        tableView.registerNib(UINib(nibName: "MArtistListCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MArtistListCell
        
        cell.lblArtistTitle.text = artists[indexPath.row].name
       
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return App.UI.artistImageSize + CGFloat(2*8)
    }
}

extension ArtistsListDataProvider {
    func addArtist(artist: Artist){
        self.artists.append(artist)
    }
    
    func addArtists(artists: [Artist]) {
        self.artists += artists
    }
}
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
        tableView.registerClass(MArtistsTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MArtistsTableViewCell
        
        cell.lblName.text = artists[indexPath.row].name
        cell.lblFollowersCount.text = "134"
        
        return cell
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
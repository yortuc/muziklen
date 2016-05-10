//
//  SongListDataProvider.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 10/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

class TrackListDataProvider: NSObject, ListDataProvider {
    
    private let cellIdentifier = "Cell"
    
    private var tracks = [Track]()
        
    func registerCellsForTableView(tableView: UITableView) {
        tableView.registerNib(UINib(nibName: "MTrackListCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MTrackListCell
        
        cell.lblSongTitle.text = tracks[indexPath.row].title
        cell.lblSongSubInfo.text = ""
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(55) //App.UI.artistImageSize + CGFloat(58)
    }
}

extension TrackListDataProvider {
    func addTrack(track: Track){
        self.tracks.append(track)
    }
    
    func addTracks(tracks: [Track]) {
        self.tracks += tracks
    }
}
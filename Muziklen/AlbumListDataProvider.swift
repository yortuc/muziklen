//
//  AlbumListDataProvider.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 10/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit


class AlbumListDataProvider: NSObject, ListDataProvider {
    
    private let cellIdentifier = "Cell"
    
    private var albums = [Album]()
    
    func registerCellsForTableView(tableView: UITableView) {
        tableView.registerNib(UINib(nibName: "MAlbumListCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MAlbumListCell
        
        cell.lblAlbumTitle.text = albums[indexPath.row].title
        cell.lblAlbumSubInfo.text =  String(albums[indexPath.row].tracks.count)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return App.UI.artistImageSize + CGFloat(2*8)
    }
}

extension AlbumListDataProvider {
    func addAlbum(album: Album){
        self.albums.append(album)
    }
    
    func addAlbums(albums: [Album]) {
        self.albums += albums
    }
}
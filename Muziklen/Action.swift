//
//  Action.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 28/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

protocol Runnable {
    func run()
}

class Action<T>: NSObject, Runnable {

    var requestParams: [String: AnyObject]?

    func run(){
        //createView(getInitialState())
        //apiRequest(params)
    }
    
    private func getInitialState()-> [T]{
        // check for cache
        return [T]()
    }
    
    private func cacheApiResponse(paramsAsKey: [String: AnyObject], apiResponse: [T]) {
        // cache request : response
    }
}


class ShowTopArtists: Action<Artist> {
    override func run() {
        let topArtistsList = MListViewController<Artist, MArtistListCell>(
            title: "Geçen Hafta",
            defaultItems: getInitialState(),
            cellNib: "MArtistListCell",
            onItemSelected: { (selectedArtist) in
                print("cell selected \(selectedArtist)")
                
                // App.pushAction( ShowTopArtists() )
                App.pushAction(ShowAlbumsForArtist(artist: selectedArtist))
            },
            configCell:  { (cell, item) in
                cell.lblArtistTitle.text = item.name
                return cell
            })
        
        currentView?.navigationController?.pushViewController(topArtistsList, animated: true)
        // currentView = topArtistsList
        
        Api.getArtists(0, errorCallback: {
            print("error")
            },
                successCallback: { artists in
                print(artists)
                topArtistsList.updateWith(artists)
                    // cacheApiResponse
            })
    }
    
    private override func getInitialState() -> [Artist] {
        print("getting from cache")
        return [  Artist(id: "123", name: "muse", listeners: 123, imageUrl: "", albums: []) ]
    }
    
    private override func cacheApiResponse(paramsAsKey: [String : AnyObject], apiResponse: [Artist]) {
        print("api response cached")
    }
}

class ShowAlbumsForArtist: Action<Album> {
    
    var artist: Artist?
    
    init(artist: Artist) {
        self.artist = artist
    }
    
    override func run() {
        let albumsList = MListViewController<Album, MAlbumListCell>(
            title: self.artist!.name,
            defaultItems: getInitialState(),
            cellNib: "MAlbumListCell",
            onItemSelected: { (selectedItem) in
                print("cell selected \(selectedItem)")
                // App.pushAction( ShowTopArtists() )
            },
            configCell:  { (cell, item) in
                cell.lblAlbumTitle.text = item.title
                return cell
            })
        
        currentView?.navigationController?.pushViewController(albumsList, animated: true)
        // currentView = albumsList
        
        Api.getAlbums(self.artist!.name, errorCallback: {
            //
            }, successCallback:  { albums in
                print(albums)
                albumsList.updateWith(albums)
            })
    }
    
    private override func getInitialState() -> [Album] {
        print("getting from cache")
        return [ Album(title: "Yükleniyor", coverImageUrl: "", tracks: [])  ]
    }
}
//
//  Api.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 14/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

/*class ArtistListApiRequest: ApiRequest {
    let name: String
    let limit: Int
    let page: Int
    
    init(name: String, limit: Int, page: Int){
        self.name = name
        self.limit = limit
        self.page = page
    }
}*/

enum RequestType {
    case ArtistList
}

struct ApiRequest<Item>{
    let type: RequestType
    let params: [String: AnyObject]
    let errorCallback: ()->Void
    let successCallback: ([Item])-> Void
}

/*let artists: [Artist] = [
    Artist(id: "asd", name: "Muse", listeners: 120, imageUrl: "", albums: [
        Album(title: "Showbiz", coverImageUrl: "", tracks: [
            Track(title: "Sunburn", youtubeAddress: ""),
            Track(title: "Muscle Museum", youtubeAddress: ""),
            Track(title: "Cave", youtubeAddress: ""),
            Track(title: "Uno", youtubeAddress: "")
            ]),
        Album(title: "Origin of Symmetry", coverImageUrl: "", tracks: [
            Track(title: "New Born", youtubeAddress: ""),
            Track(title: "Bliss", youtubeAddress: ""),
            Track(title: "Space Dementia", youtubeAddress: ""),
            Track(title: "Plugin Baby", youtubeAddress: "")
            ]),
        Album(title: "Absolution", coverImageUrl: "", tracks: [
            Track(title: "Sing for Absolution", youtubeAddress: ""),
            Track(title: "Time is Running Out", youtubeAddress: ""),
            Track(title: "Stockholm Syndrome", youtubeAddress: "")
            ]),
        Album(title: "Black Holes and Revelations", coverImageUrl: "", tracks: [])
        ]),
    Artist(id: "q123", name: "Queen", listeners: 450, imageUrl: "", albums: [
        Album(title: "Jazz", coverImageUrl: "", tracks: []),
        Album(title: "Innuendo", coverImageUrl: "", tracks: []),
        Album(title: "Phantom of The Opera", coverImageUrl: "", tracks: [])
        ]),
    Artist(id: "asd", name: "Talking Heads", listeners: 20,  imageUrl: "", albums: [])
]
*/

class Api: NSObject {
    
    private static func makeRequest(url: String, params: [String: AnyObject], errorCallback: ()->Void, successCallback: (AnyObject)->Void) {
        
        Alamofire.request(
            .GET,
            url,
            parameters: params
        )
        .responseJSON { response in
                
            switch response.result {
            case .Success(let apiResponse):
                successCallback(apiResponse)
                break
            case .Failure(let err):
                print("eerrr \(err)")
                errorCallback()
            }
        }
    }
    
    static func getArtists(page: Int, errorCallback: ()->(), successCallback: [Artist]->Void) {
        
        let params: [String: AnyObject] = [
            "limit": 10,
            "page": page
        ]
        
        print("making req")
        
        makeRequest(App.URLs.collection("artists"), params: params, errorCallback: errorCallback, successCallback:  { response in
            
            var retArtists = [Artist]()
            
            let json = JSON(response)
            print(json)
            
            let rows = json.array
            
            for data in rows! {
                
                var imageUrl = ""
                
                let images = data["image"].array
                
                for img in images! {
                    if img["size"].stringValue == "medium" {
                        imageUrl = img["text"].stringValue
                        break
                    }
                }
                
                let artist = Artist(
                    id: data["_id"].stringValue,
                    name: data["name"].stringValue,
                    listeners: data["listeners"].intValue,
                    imageUrl: imageUrl,
                    albums: [])
                
                retArtists.append(artist)
            }
            
            successCallback(retArtists)
        })
    }
    
    static func getAlbums(artist: String, errorCallback: ()->Void, successCallback: [Album]->Void) {
        
        successCallback([
            Album(title: "Black Holes and Revelations", coverImageUrl: "", tracks: []),
            Album(title: "Absolution", coverImageUrl: "", tracks: []),
            Album(title: "Origin of symmetry", coverImageUrl: "", tracks: []),
            Album(title: "Showbiz", coverImageUrl: "", tracks: [])
        ])
    }
}

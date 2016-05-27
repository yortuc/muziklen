//
//  Artist.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 05/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

struct Artist {
    let id: String
    let name: String
    let listeners: Int
    let imageUrl: String
    
    let albums: [Album]
}

struct Album{
    let title: String
    let coverImageUrl: String
    let tracks: [Track]
}

struct Track {
    let title: String
    let youtubeAddress: String
}
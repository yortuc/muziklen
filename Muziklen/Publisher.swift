//
//  Publisher.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 14/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

class Publisher: NSObject {
    
    typealias Callback = (AnyObject?)-> Void
    
    static var channels: [String: [Callback] ] = [:]
    
    static func publish(message:String, data:AnyObject?) {
        if let callbacks = channels[message] {
            let _ = callbacks.map({ $0(data) })
        }
    }
    
    static func subscibe(message:String, callback: Callback) {
        if var channel = channels[message] {
            channel.append(callback)
        }else{
            channels[message] = [callback]
        }
    }
}


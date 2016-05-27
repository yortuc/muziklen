//
//  App.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 10/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

struct App {

    struct UI {
        static let artistImageSize = CGFloat(52)
        static let artistCornerRadius = CGFloat(0)
        
        static func showServerError(completion onCompletion: (()-> Void)?) {
            print("complete")
        }
        
        static func topView() -> UINavigationController? {
            if var topController = UIApplication.sharedApplication().keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                
                let navController = topController as! UINavigationController
                
                return navController //.pushViewController(viewController, animated: true)
                // topController.presentViewController(viewController, animated: true, completion: nil)
            }
            
            return nil
        }
    }
    
    struct URLs {
        static var apiRoot = ""
        
        static func collection(collection: String) -> String {
            return apiRoot + collection
        }
        
        private static func load() {
            let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")
            let dict = NSDictionary(contentsOfFile: path!)
            
            let apiRoot = dict!.valueForKey("apiRoot") as? String
            
            App.URLs.apiRoot = apiRoot!
            
            print(apiRoot)
        }
    }
    
    static func LoadSettings(){
        URLs.load()
    }
    
    static func pushAction(action: Runnable) {
        action.run()
    }
}

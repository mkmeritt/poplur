//
//  InitialSignInViewController.swift
//  ProfileCreation
//
//  Created by Anthony Ma on 10/8/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import UIKit

/*
https://www.googleapis.com/youtube/v3/channels?part=snippet&type=channel&forUsername=Apple&key=AIzaSyCK8NV2bi5TPJ3-wa60C5vEqQMGEx8CQP4&maxResults=50&pageToken= - username channel get (for channel ID)
https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UCE_M8A5yxnLfW0KghEeajjw&key=AIzaSyDkxv_bkBGMVwk1gfRw5ztXnPMX4s7vgCE - playlist check 
https://www.googleapis.com/youtube/v3/search?&channelId=UCE_M8A5yxnLfW0KghEeajjw&part=snippet,id&order=date&maxResults=15&key=AIzaSyDkxv_bkBGMVwk1gfRw5ztXnPMX4s7vgCE - get videos from channelID
 
*/

class InitialSignInViewController: IndexViewController {
    
    var leftSideTitleAPI: NSString = "https://www.googleapis.com/youtube/v3/channels?part=snippet&type=channel&forUsername="
    var leftSideChannelAPI: NSString = "https://www.googleapis.com/youtube/v3/search?&channelId=UCE_M8A5yxnLfW0KghEeajjw&part=snippet,id&order=date"
    var APIKey: NSString = "&key=AIzaSyCK8NV2bi5TPJ3-wa60C5vEqQMGEx8CQP4&maxResults=50&pageToken="
    
    var userChannelTitle: NSString = ""
    var channelId: NSString = ""
    
    var API: NSString = ""
    
    var dictionaryAPI: NSDictionary = [:]
    var infoDictionaryAPI: NSMutableDictionary = [:]
    
    var signUpViewController: UserController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   //     _ = UserController()
        
        self.API = String("\((leftSideChannelAPI as String) + (APIKey as String))")
        self.infoDictionaryAPI = [:]
        
        self.view.backgroundColor = UIColor.blackColor()
        
        self.getDictionary()
        
//        print(self.infoDictionaryAPI)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUsername() -> String {
        
        let channelTitle: NSString = self.userChannelTitle
        let leftSide = String("\((leftSideTitleAPI as String) + (channelTitle as String))")
        self.API = String("\((leftSide as String) + (APIKey as String))")
        
        return self.API as String
    }
    
    func getChannelId() {
        
        
        self.API = String("\((leftSideChannelAPI as String) + (APIKey as String))")
        
        //        let channelID: String = getString(getDictionary())
    }
    
    func getString(dictionary: NSMutableDictionary) -> String {
        return ""
    }
    
    func getDictionary() {
        let APIKey = self.API
        let url = NSURL.init(string: APIKey as String)
        let dictionary: NSMutableDictionary = [:]
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            NSURLSession.sharedSession().dataTaskWithURL(url! as NSURL) { (let data: NSData?, let response: NSURLResponse?, let error: NSError?) -> Void in
                if (error == nil && data != nil) {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data! as NSData, options: NSJSONReadingOptions.MutableContainers) as! [String:AnyObject]
                        dictionary.addEntriesFromDictionary(json)
                        self.dictionaryAPI = dictionary
                        
                        self.infoDictionaryAPI.addEntriesFromDictionary(self.dictionaryAPI as Dictionary)
                    
                        dispatch_async(dispatch_get_main_queue(), {
                            
                        })
                        print(self.infoDictionaryAPI)
//                        print(dictionary)
                        
                    } catch {
                        fatalError()
                    }
                }
            }.resume()
        }
    }
}

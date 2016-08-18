//
//  APIObject.swift
//  ProfileCreation
//
//  Created by Anthony Ma on 16/8/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import UIKit

class APIObject: NSObject {

    static let sharedInstance = APIObject()
    
    //API variables
    var leftSideTitleAPI: String = "https://www.googleapis.com/youtube/v3/search?part=id%2Csnippet&maxResults=1&type=channel&q="
    var leftSideChannelAPI: String = "https://www.googleapis.com/youtube/v3/search?&part=snippet,id&order=date&channelId="
    var APIKey: String = "&key=AIzaSyCK8NV2bi5TPJ3-wa60C5vEqQMGEx8CQP4&maxResults=50&pageToken="
    
    //channel name and ID
    var userChannelTitle: String = ""
    var channelId: String = ""
    
    //final API string
    var API: String = ""

    var dictionaryAPI: NSDictionary?
    var infoDictionaryAPI: NSDictionary?
    
    var userVideos: [Video]!
    
    // get channel ID
    func getChannelAPI() {
        
        let channelTitle: String = self.userChannelTitle
//        let leftSide = String("\((leftSideTitleAPI as String) + (channelTitle as String))")
//        self.API = String("\((leftSide as String) + (APIKey as String))")
        let leftSide = String("\(String(leftSideTitleAPI) + String(channelTitle))")
        self.API = String("\(String(leftSide) + String(APIKey))")

        print(self.API)
    
    }
    
    // API Call
    func getChannelID(callback: (String) -> Void) {
        self.getChannelAPI()
        let APIKey = self.API
        let url = NSURL.init(string: APIKey as String)

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            NSURLSession.sharedSession().dataTaskWithURL(url! as NSURL) { (let data: NSData?, let response: NSURLResponse?, let error: NSError?) -> Void in
     
                if (error == nil && data != nil) {
                    do {
                        let dictionaryData = try NSJSONSerialization.JSONObjectWithData(data! as NSData, options: NSJSONReadingOptions.MutableContainers) as! [String:AnyObject]
                        
                        print(dictionaryData)
                        
                        if let items = dictionaryData["items"] as? [[String: AnyObject]] {
                            if let first = items.first  {
                                if let property = first["id"] as? [String: String] {
                                    if let cid = property["channelId"] {
                                        self.channelId = cid
                                    }
                                }
                            }
                        }
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            callback(self.channelId)
                        })
                        
                    } catch {
                        fatalError()
                    }
                }
            }.resume()
        }
    }

    // get video
    func getVideoAPI() {
        
        let channelID: String = self.channelId
        let leftSide = String("\(String(leftSideChannelAPI) + String(channelID))")
        self.API = String("\(String(leftSide) + String(APIKey))")
        print(self.API)
        
    }
    
    //API Call
    func getVideos(callback: ([Video]) -> Void) {
        self.getVideoAPI()
        let APIKey = self.API
        var result:[Video] = []
        let url = NSURL.init(string: APIKey as String)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            NSURLSession.sharedSession().dataTaskWithURL(url! as NSURL) { (let data: NSData?, let response: NSURLResponse?, let error: NSError?) -> Void in
                
                if (error == nil && data != nil) {
                    do {
                        let dictionaryData = try NSJSONSerialization.JSONObjectWithData(data! as NSData, options: NSJSONReadingOptions.MutableContainers) as! [String:AnyObject]
                        
                        print(dictionaryData)
                        
                        if let items = dictionaryData["items"] as? [[String: AnyObject]] {
                            for item in items {
                                if let id = item["id"] {
                                let videoId = id["videoId"] as? String
                                if let videoId = videoId {
                                    if videoId.isEmpty {
                                        continue
                                    }
                                    let video = Video()
                                    video.videoId = videoId
                                    print(video.videoId)
                                    result.append(video)
                                }
                                }
                            }
                            self.userVideos = result
                        }
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            callback(self.userVideos)
                        })
                        print(self.userVideos)
                        
                    } catch {
                        fatalError()
                    }
                }
                }.resume()
        }
    }
    
}

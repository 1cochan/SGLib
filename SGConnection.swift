//
//  SGConnection.swift
//  GraphicalVideoPlayer
//
//  Created by KoichiAdachi on 2015/02/21.
//  Copyright (c) 2015年 default. All rights reserved.
//

import UIKit

class SGConnection: NSObject {
    enum HTTP_METHOD{
        static let POST = "POST"
    }
    let timeoutIntervalDefaultMillSec : NSTimeInterval = 2000;
    class func execute(method : NSString, path : NSString, body : NSData?, headers : NSMutableDictionary?, timeoutInterval: NSTimeInterval, block : ((data : NSData) ->())?, failureblock : ()->()){
        if(HTTP_METHOD.POST == method){
            var url = NSURL(string: path)
            var request = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeoutInterval)
            request.HTTPMethod = HTTP_METHOD.POST
            request.HTTPBody = body
            
            var response : AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
            var error : NSErrorPointer = nil;
            
            var data = NSURLConnection.sendSynchronousRequest(
                request
                , returningResponse: response
                , error: error)
            
            block!(data:data!)
        }
    }
}


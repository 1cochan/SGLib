//
//  Extension.swift
//  GraphicalVideoPlayer
//
//  Created by KoichiAdachi on 2015/02/21.
//  Copyright (c) 2015年 default. All rights reserved.
//

import Foundation

extension NSData{
    func ex2NSString() -> NSString{
        var string = NSString(data: self, encoding: NSUTF8StringEncoding);
        return string!;
    }
}

//
//  ListingDataManager.swift
//  ShareATextbook
//
//  Created by ITP312 on 4/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class ListingDataManager: NSObject {
    
    class func getPosting(id: String,
                          onComplete: ((_ : [List]) -> Void)?)
    {
        let url = "http://13.228.39.122/FP04_523746827346837/1.0/posting/get"
        let json = JSON.init([
            "id" : id
        ])
        
        HTTP.postJSON(
            url: url,
            json: json, onComplete:
            {
                json, response, error in
                if json == nil
                {
                    return
                }
                print(json!)
                var listingList : [List] = []
                for var i in 0 ..< json!.count
                {
                    let listjson = json![i]
                    let list = List(
                        id: listjson["id"].string!,
                        by:listjson["by"].string!,
                        byid:listjson["byid"].string!,
                        postdt:listjson["postdt"].string!,
                        name:listjson["name"].string!,
                        isbn:listjson["isbn"].string!,
                        desc:listjson["desc"].string!,
                        photo:listjson["photo"].string!,
                        tags:listjson["tags"].string!,
                        cateid:[listjson["cateid"].string!],
                        preferredloc:listjson["preferredloc"].string!)
                    listingList.append(list)
                }
                onComplete?(listingList)
        })

    }

}

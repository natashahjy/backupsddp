//
//  UploadDataManager.swift
//  ShareATextbook
//
//  Created by ITP312 on 3/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//
// Linking fairprice api

import UIKit

class UploadDataManager: NSObject {
    
     
    class func upload(token: String,
                      catID: [String],
                      bookTitle: String,
                      isbn: String,
                      desc: String,
                      author:String,
                      publisher:String,
                      edition:String,
                      photos:String,
                      preferredLoc: String)
    {
        let url = "http://13.228.39.122/FP04_523746827346837/1.0/posting/add"
        let json = JSON.init([
            "token" : token,
            "cateid" : catID,
            "name" : bookTitle,
            "isbn" : isbn,
            "desc" : desc,
            "author" : author,
            "publisher" : publisher,
            "edition" : edition,
            "photos" : [""],
            "preferredLoc" : ""
            ])
        
        
        HTTP.postJSON(
            url: url,
            json: json,
            onComplete:
            {
                json, response, error in
    
                if json == nil
                {
                    return
                }
                print(json!)
        })
    }
}

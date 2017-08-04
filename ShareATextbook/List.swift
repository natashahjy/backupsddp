//
//  List.swift
//  ShareATextbook
//
//  Created by ITP312 on 4/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class List: NSObject {

    var id : String! = ""
    var by : String! = ""
    var byid : String! = ""
    var postdt : String! = ""
    var name: String! = ""
    var isbn: String! = ""
    var desc : String! = ""
    var photo : String! = ""
    var tags : String! = ""
    var cateid : [String] = []
    var preferredloc : String! = ""
    
    init(id:String,
         by:String,
         byid: String,
         postdt:String,
         name:String,
         isbn:String,
         desc:String,
         photo:String,
         tags:String,
         cateid: [String],
         preferredloc:String)
    {
        self.id = id
        self.by = by
        self.byid = byid
        self.postdt = postdt
        self.name = name
        self.isbn = isbn
        self.desc = desc
        self.photo = photo
        self.tags = tags
        self.cateid = cateid
        self.preferredloc = preferredloc
        super.init()
    }
}

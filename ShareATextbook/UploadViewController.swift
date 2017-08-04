//
//  UploadViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 6/6/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController {
    
    var barcode: String!
    var bookTitle: String!
    var category : String!
    var desc: String!
    var author: String!
    var publisher: String!
    var edition: String!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var barcodeLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var editionLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var listingList: [List] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let dateResult = formatter.string(from: date)
        
        dateLabel.text = dateResult
        barcodeLabel.text = barcode
        authorLabel.text = author
        publisherLabel.text = publisher
        editionLabel.text = edition
        descLabel.text = desc
        userLabel.text = ""
        titleLabel.text = bookTitle

    }


    func loadListing() {
        ListingDataManager.getPosting(id: "", onComplete: {
            listList in
            
            self.listingList = listList
            
            DispatchQueue.main.async
                {
            
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

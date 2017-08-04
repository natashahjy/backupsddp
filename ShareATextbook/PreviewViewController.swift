//
//  PreviewViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 10/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController{
    
    var barcode: String!
    var bookTitle: String!
    var category : String!
    var desc: String!
    var author: String!
    var publisher: String!
    var edition: String!
    var cateID: String!
    var cateID2: String!
    var categoryIDs: [String] = []
    
    @IBOutlet weak var barcodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var editionLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBAction func confirmButton(_ sender: Any) {
        print("title=\(bookTitle)")
        
        print("barcode=\(barcode)")
        
        print("category=\(category)")
        
        print("author=\(author)")
        print("publisher=\(publisher)")
        print("cate ID=\(cateID)")
        print("desc=\(desc)")
        print("edition=\(edition)")
        
        upload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.barcodeLabel.text = barcode
        self.titleLabel.text = bookTitle
        self.categoryLabel.text = category
        self.descLabel.text = desc
        self.editionLabel.text = edition
        self.authorLabel.text = author
        self.publisherLabel.text = publisher
        categoryIDs.append(cateID)
        categoryIDs.append(cateID2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func upload(){
        UploadDataManager.upload(token: LoginGlobalVar.token,
                                 catID: categoryIDs,
                                 bookTitle: titleLabel.text!,
                                 isbn: barcodeLabel.text!,
                                 desc: descLabel.text!,
                                 author: authorLabel.text!,
                                 publisher: publisherLabel.text!,
                                 edition: editionLabel.text!,
                                 photos: "",
                                 preferredLoc: "")
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Upload" {
          /*
            let uploadVC = segue.destination as! UploadViewController
            uploadVC.barcode = barcode
            uploadVC.bookTitle = bookTitle
            uploadVC.category = category
            uploadVC.author = author
            uploadVC.publisher = publisher
            uploadVC.edition = edition
            uploadVC.desc = desc
             */
        }
    }

}

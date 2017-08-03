//
//  DescriptionViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 25/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    var barcode: String!
    var bookTitle: String!

    @IBOutlet weak var descTextView: UITextView!
    
    @IBOutlet weak var authorTextField: UITextField!
    
    @IBOutlet weak var publisherTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var upload = Upload()
        upload.desc = descTextView!.text
        upload.author = authorTextField!.text
        upload.publisher = publisherTextField!.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCategory" {
            let categoryVC = segue.destination as! CategoryViewController
            categoryVC.barcode = barcode
            categoryVC.bookTitle = bookTitle
            categoryVC.desc = descTextView!.text
            categoryVC.author = authorTextField!.text
            categoryVC.publisher = publisherTextField!.text
        }
    }
}

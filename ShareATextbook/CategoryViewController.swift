//
//  CategoryViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 28/6/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var barcode: String!
    var bookTitle: String!
    var desc: String!
    var author: String!
    var publisher: String!
    
    @IBOutlet weak var categoryPicker : UIPickerView!
    @IBOutlet weak var nextButton : UIButton!
    @IBOutlet weak var editionTextField: UITextField!
    
    // Declare string array
    var categoryList: [Category] = []
    var categoryList2: [Category] = []
    
    @IBAction func selectButton(sender: AnyObject){
        let row = categoryPicker.selectedRow(inComponent: 0)
        
        let selected = categoryList[row].name
        let selected2 = categoryList2[row].name
        
        let uiAlert = UIAlertController(
            title: "You selected \(selected) \(selected2)",
            message: "Click to dismiss",
            preferredStyle:UIAlertControllerStyle.alert)
        
        
        uiAlert.addAction(UIAlertAction(
            title: "Dismiss",
            style: .default,
            handler: nil))
        
        self.present(
            uiAlert, animated: true,
            completion: nil)
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        print("title=\(bookTitle)")
        
        print("barcode=\(barcode)")
        
        print("desc=\(desc)")
        
        print("author=\(author)")
        
        print("publisher=\(publisher)")
        
    }
    
    func loadCategory()
    {
        CategoryDataManager.category(limit: 10, name: "", heading: "", onComplete:
        {
            categoryList in
            
            self.categoryList = categoryList
            self.categoryList2 = categoryList
        
            DispatchQueue.main.async
            {
                    self.categoryPicker.reloadAllComponents()
                    self.nextButton.isEnabled = true
            }
        })
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0
        {
            return categoryList.count
        }
        else
        {
            return categoryList2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0
        {
            return categoryList[row].name
        }
        else
        {
            return categoryList2[row].name
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadCategory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Preview" {
            let previewVC = segue.destination as! PreviewViewController
            previewVC.barcode = barcode
            previewVC.bookTitle = bookTitle
            previewVC.desc = desc
            previewVC.author = author
            previewVC.publisher = publisher
            
            //you can get selected value on pickerview
            let category = String(categoryList[categoryPicker.selectedRow(inComponent: 0)].name)
            let categoryId = String(categoryList[categoryPicker.selectedRow(inComponent: 0)].id)
            let categoryId2 = String(categoryList2[categoryPicker.selectedRow(inComponent: 0)].id)
            previewVC.category = category
            previewVC.cateID = categoryId
            previewVC.cateID2 = categoryId2
            previewVC.edition = editionTextField!.text
            
        }
    }

}

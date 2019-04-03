//
//  AddViewController.swift
//  Assignment1
//
//  Created by Min young Go on 22/3/19.
//  Copyright © 2019 Min young Go. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    
    
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var itemText: UITextField!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    
    
    var backUp = objects
    var totalbackUp = final[0].object
    
    
    var categoryName = ""
    var categoryIndex = 0
    var listCount = (objects.count) - 1
   
    @IBAction func backbutton(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func categoryAction(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
            categoryName = categorySegment.titleForSegment(at: categorySegment.selectedSegmentIndex)!
            categoryIndex = 0
            
        case 1:
            categoryName = categorySegment.titleForSegment(at: categorySegment.selectedSegmentIndex)!
            categoryIndex = 1

            
        case 2:
            categoryName = categorySegment.titleForSegment(at: categorySegment.selectedSegmentIndex)!
            categoryIndex = 2

            
        default:
            categoryName = "education"
            
        }
        
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        _ = navigationController?.popViewController(animated: true)
        
        let countList = (objects.count - 1)
        if countList >= 1{
            
            objects = backUp
            final[0].object = totalbackUp
            
        }
//
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceText.delegate = self
        // Do any additional setup after loading the view.
    }
    
   
    
   
}

extension AddViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        var item = ""
        var price:Float = 0.0
        
        if (itemText.text != "" && priceText.text != ""){
            item = itemText.text!
            guard let newPrice = Float(priceText.text!) else{
                return
            }
            price = newPrice
        }
        
        
        if categoryName == ""{
            categoryName = "Education"
            
        }
        
        if(item != ""){

            objects.append(Expense(item: item, price: price, categoryName: categoryName))
            final[0].object.append(Expense(item: item, price: price, categoryName: categoryName))
        
        }
//        print(final.total())
//        print(final.educationTotal())
//        print(final.entertainmentTotal())
//        print(final.shoppingTotal())
    }
    
    
    
}



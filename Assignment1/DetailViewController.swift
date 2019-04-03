//
//  DetailViewController.swift
//  Assignment1
//
//  Created by Min young Go on 22/3/19.
//  Copyright © 2019 Min young Go. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var categoryName:String = ""
    var cancelBackup = Expense(item: "", price: 0.0, categoryName: "")
    var index = 0

    @IBOutlet weak var categorySegment: UISegmentedControl!
    
    @IBOutlet weak var itemText: UITextField!
    
    @IBOutlet weak var priceText: UITextField!
    
    @IBAction func updateCancel(_ sender: UIBarButtonItem) {
        detailItem = cancelBackup
        totalDetailItem = cancelBackup
        
        _ = navigationController?.popViewController(animated: true)
    }


    
    func configureView() {
        // Update the user interface for the detail item.

        if let detail = detailItem {
            if let item = itemText {
                item.text = detail.item
            }
            if let price = priceText {
                let newPrice = String(detail.price)
                price.text = newPrice
            }
            let k = detail.categoryName
            if (k == "Education"){
                index = 0
            }
            else if (k == "Shopping"){
                index = 1
            }
            else if (k == "Entertainment"){
                index = 2
            }
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        categorySegment.selectedSegmentIndex = index
        itemText.delegate = self
        priceText.delegate = self

        
        configureView()
    }

    var detailItem: Expense? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    var totalDetailItem: Expense? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

extension DetailViewController: UITextFieldDelegate {
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let di = detailItem else {return}
        di.categoryName = categorySegment.titleForSegment(at: categorySegment.selectedSegmentIndex)!

        switch textField {
        case itemText:
            guard let di = detailItem, let it = itemText.text else{return}
            guard let tdi = totalDetailItem, let ti = itemText.text else{return}
            di.item = it
            tdi.item = ti
    
        case priceText:
            guard let di = detailItem, let pt = priceText.text else{return}
            guard let tdi = totalDetailItem, let tp = priceText.text else{return}
            di.price = Float(pt)!
            tdi.price = Float(tp)!
            
           
        default:
            print("unknown field")
        }
        
       
    }

    
}


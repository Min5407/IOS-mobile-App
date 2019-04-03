//
//  Expense.swift
//  Assignment1
//
//  Created by Min young Go on 22/3/19.
//  Copyright © 2019 Min young Go. All rights reserved.
//

import Foundation

/// Expense class is used for product's item, categoryName and price
class Expense{
    
    var item: String = ""
    var price: Float = 0.0
    var categoryName: String = ""
    var object = [Expense]()
    
    init(item:String, price:Float, categoryName:String) {
        self.item = item
        self.price = price
        self.categoryName = categoryName
    }
}







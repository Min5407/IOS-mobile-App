//
//  File.swift
//  Assignment1
//
//  Created by Min young Go on 29/3/19.
//  Copyright © 2019 Min young Go. All rights reserved.
//

/// Overall total is used for finding overall total and each category total
import Foundation

class Overall{
    
    var section : String
    var object = [Expense]()
    
    init(section: String) {
        self.section = section
    }
    
    /// uses for loop to get price for all the item
    ///
    /// - Returns: return overall total in Float type
    func total() -> Float{
        var total: Float = 0
        
        for i in object{
            let priceTotal = i.price
            total += priceTotal
        }
        return total
    }
    
    /// Uses for loop to get all the prices for education item
    ///
    /// - Returns: return education category total in Float Type
    func educationTotal()-> Float{
        var educationTotal:Float = 0
        for i in object{
            if i.categoryName == "Education"{
                educationTotal += i.price
            }
            
        }
        return educationTotal
        
    }
    /// Uses for loop to get all the prices for shopping item
    ///
    /// - Returns: return shopping category total in Float Type
    func shoppingTotal()-> Float{
        var shoppingTotal:Float = 0
        for i in object{
            if i.categoryName == "Shopping"{
                shoppingTotal += i.price
            }
            
        }
        return shoppingTotal
        
    }
    
    /// Uses for loop to get all the prices for entertainment total in Float type
    ///
    /// - Returns: return entertainment total in Float Type
    func entertainmentTotal()-> Float{
        var entertainmentTotal:Float = 0
        for i in object{
            if i.categoryName == "Entertainment"{
                entertainmentTotal += i.price
            }
            
        }
        return entertainmentTotal
        
    }
    
    
    
}

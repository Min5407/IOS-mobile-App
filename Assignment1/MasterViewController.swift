







//
//  MasterViewController.swift
//  Assignment1
//
//  Created by Min young Go on 22/3/19.
//  Copyright © 2019 Min young Go. All rights reserved.
//

import UIKit


var objects = [Expense]()
var final = [
    Overall(section: "List"),
    Overall(section: "Total Section"),
    Overall(section: "Overall")
]



class MasterViewController: UITableViewController {
   
   
    var detailViewController: DetailViewController? = nil
    
    let sections = ["list", "Overall total","total"]



    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        final[1].object.append(Expense(item: "...", price: final[0].educationTotal(), categoryName: ".."))
        final[1].object.append(Expense(item: "...", price: final[0].shoppingTotal(), categoryName: ".."))
        final[1].object.append(Expense(item: "...", price: final[0].entertainmentTotal(), categoryName: ".."))

        final[2].object.append(Expense(item: "...", price: final[0].total(), categoryName: ".."))

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @objc
    func insertNewObject(_ sender: Any) {
        performSegue(withIdentifier: "addWay", sender: self)
        
    }
    
   

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let totalObject = final[0].object[indexPath.row]
                let totalController = (segue.destination) as! DetailViewController
                totalController.totalDetailItem = totalObject
                let controller = (segue.destination ) as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        
      
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return final[section].object.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object =  final[indexPath.section].object[indexPath.row]
        
        
        
        if indexPath.section == 0{
            cell.textLabel!.text = ("\(object.categoryName): \(object.item) ")
            cell.detailTextLabel!.text = ("$\(object.price)")
        }
        if indexPath.section == 1{
            if indexPath.row == 0{
                cell.textLabel!.text = ("education Total:")
                cell.detailTextLabel!.text = ("$\(final[0].educationTotal())")
            }
            
            if indexPath.row == 1{
                cell.textLabel!.text = ("shopping Total:")
                cell.detailTextLabel!.text = ("$\(final[0].shoppingTotal())")
            }
            
            if indexPath.row == 2{
                cell.textLabel!.text = ("Entertainment Total:")
                cell.detailTextLabel!.text = ("$\(final[0].entertainmentTotal())")
            }
   
        }
        
        if indexPath.section == 2{
            cell.textLabel!.text = ("Overall Total:")
            cell.detailTextLabel!.text = ("$\(final[0].total())")
        }

    
        return cell
    }

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        if indexPath.section == 0{
            return true
        }
        else{
            return false
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 0{
            return indexPath
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            final[0].object.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}


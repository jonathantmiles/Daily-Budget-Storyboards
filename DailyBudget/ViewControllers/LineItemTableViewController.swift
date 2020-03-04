//
//  LineItemTableViewController.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 2/21/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import UIKit

class LineItemTableViewController: UITableViewController {

    var lineItemController = LineItemController()
//    var tableTest: [LineItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let calendar = Calendar.current
        
        let dateComponents1 = DateComponents(calendar: calendar, year: 2020, month: 3, day: 1)
        let dateComponents2 = DateComponents(calendar: calendar, year: 2020, month: 3, day: 3)
        
        let date1 = calendar.date(from: dateComponents1)!
        let date2 = calendar.date(from: dateComponents2)!
        
        let lineItem1 = LineItem(itemName: "donuts", category: .food, amount: 1.85, date: date1)
        let lineItem2 = LineItem(itemName: "Italian Soup fixings", category: .groceries, amount: 14.92, date: date2)
        if lineItemController.lineItems.isEmpty {
            lineItemController.lineItems = [lineItem1, lineItem2]
        }
        
//        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lineItemController.lineItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LineItemCell", for: indexPath)

        let lineItem = lineItemController.lineItems[indexPath.row]
        cell.textLabel?.text = lineItem.itemName
        cell.detailTextLabel?.text =  lineItem.category.rawValue
        let label = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
        label.text = String(lineItem.amount)
        cell.accessoryView = label

        return cell
    }
    
    // MARK: - helper methods
    
    private func updateViews() {
        tableView.reloadData()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? AddNewLineItemViewController
        destVC?.lineItemController = lineItemController
        let index = (tableView.indexPathForSelectedRow?.row)!
        if segue.identifier == "AddNewLineItem" {
            
        } else if segue.identifier == "ShowDetailLineItem" {
            destVC?.lineItem = lineItemController.lineItems[index]
        }
    }

}

//
//  LineItemTableViewController.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 2/21/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import UIKit

class LineItemTableViewController: UITableViewController {

    var tableTest: [LineItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let lineItem1 = LineItem(itemName: "donuts", category: .food, amount: 1.85)
        let lineItem2 = LineItem(itemName: "Italian Soup fixings", category: .groceries, amount: 14.92)
        tableTest = [lineItem1, lineItem2]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableTest?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LineItemCell", for: indexPath)

        cell.textLabel?.text = tableTest?[indexPath.row].itemName

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

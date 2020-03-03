//
//  BudgetTargetTableViewController.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 3/3/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import UIKit

class BudgetTargetTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let budgetTarget1 = BudgetTarget(maxSpendPerIncrement: 150.00, category: .discretionary, increment: DateComponents())
        let budgetTarget2 = BudgetTarget(maxSpendPerIncrement: 300.00, category: .food, increment: DateComponents())
        budgetController.targets = [budgetTarget1, budgetTarget2]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgetController.targets?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BudgetTargetCell", for: indexPath)
        
        guard let targets = budgetController.targets else { return cell }
        cell.textLabel?.text = targets[indexPath.row].category.rawValue
        let spendDouble = targets[indexPath.row].maxSpendPerIncrement
        cell.detailTextLabel?.text = String(format: "$ %.2f", spendDouble)

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
    
    // MARK: - Properties
    
    let budgetController = BudgetController()

}

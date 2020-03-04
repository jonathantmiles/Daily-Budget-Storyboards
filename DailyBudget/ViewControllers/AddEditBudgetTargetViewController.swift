//
//  AddEditBudgetTargetViewController.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 3/3/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import UIKit

class AddEditBudgetTargetViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        
        guard let maxSpendString = amountTextField.text,
            let maxSpend = Double(maxSpendString),
            let bc = budgetController else { return }
        let category = CategoryTypes.allCases[categoryPickerView.selectedRow(inComponent: 0)]
        
        if (budgetTarget != nil) {
            let index = associatedIndex!
            let newBudgetTarget = BudgetTarget(maxSpendPerIncrement: maxSpend, category: category, increment: DateComponents())
            bc.replace(budgetTarget: newBudgetTarget, atIndex: index)
        } else {
            bc.addNewBudgetTarget(maxSpend: maxSpend, category: category, increment: DateComponents())
        }
        
        let prevVC = navigationController?.viewControllers[0] as? BudgetTargetTableViewController
        prevVC?.budgetController = bc
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - helper functions
    
    private func setUpViews() {
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        
        if let budgetTarget = budgetTarget {
            amountLabel.text = budgetTarget.category.rawValue
            let incrementString = budgetTarget.maxSpendPerIncrement
            amountTextField.text = String(format: "%.2f", incrementString)
            saveChangesButtonLabel.setTitle("Save Changes", for: .normal)
            let index = CategoryTypes.allCases.firstIndex(of: budgetTarget.category)!
            categoryPickerView.selectRow(index, inComponent: 0, animated: true)
        } else {
            amountLabel.text = "Please enter the amount to be budgeted:"
            amountTextField.placeholder = "Enter a dollar amount:"
            saveChangesButtonLabel.setTitle("Add New Budget Target", for: .normal)
        }
    }
    
    // MARK: - PickerViewDataSource Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CategoryTypes.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CategoryTypes.allCases[row].rawValue
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
    
    var budgetTarget: BudgetTarget?
    var budgetController: BudgetController?
    var associatedIndex: Int?
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var saveChangesButtonLabel: UIButton!
}

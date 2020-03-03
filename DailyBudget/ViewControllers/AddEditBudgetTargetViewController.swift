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
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
    
    // MARK: - helper functions
    
    private func setUpViews() {
        
        if (budgetTarget != nil) {
            amountLabel.text = budgetTarget?.category.rawValue
            if let incrementString = budgetTarget?.maxSpendPerIncrement {
                amountTextField.text = String(format: "$ %.2f", incrementString)
            }
        } else {
            amountLabel.text = "Please enter the amount to be budgeted:"
            amountTextField.placeholder = "Enter a dollar amount:"
        }
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
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
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var categoryPickerView: UIPickerView!
}

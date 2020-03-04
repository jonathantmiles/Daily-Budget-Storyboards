//
//  AddNewLineItemViewController.swift
//  DailyBudget
//
//  Created by Jonathan T. Miles on 2/21/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import UIKit

class AddNewLineItemViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    
    @IBAction func addNewLineItem(_ sender: Any) {
        let lic = lineItemController!
        guard let name = nameTextField.text,
            let amountString = amountTextField.text,
            let amount = Double(amountString) else { return }
        let category = CategoryTypes.allCases[categoryPickerView.selectedRow(inComponent: 0)]
        
        if let lineItem = lineItem {
            lic.updateLineItem(lineItem: lineItem, itemName: name, category: category, amount: amount, date: Date())
        } else {
            
                lic.addNewLineItem(itemName: name, category: category, amount: amount, date: Date())
        }
        let prevVC = navigationController?.viewControllers[0] as? LineItemTableViewController
        prevVC?.lineItemController = lic
        navigationController?.popViewController(animated: true)
    }
    
    func setUpView() {
        if lineItem != nil {
            if let lineItem = lineItem {
                nameTextField.text = lineItem.itemName
                amountTextField.text = String(format: "%.2f", lineItem.amount)
            }
            saveChangesLabel.setTitle("Save Changes", for: .normal)
        } else {
            nameTextField.placeholder = "Name of purchase"
            amountTextField.placeholder = "Amount of purchase"
            saveChangesLabel.setTitle("Create new line item", for: .normal)
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
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! LineItemTableViewController
        if let lic = lineItemController {
            destVC.lineItemController = lic
        }
    }
    
    // MARK: - Properties
    
    var lineItemController: LineItemController?
    var lineItem: LineItem?
    
    // MARK: - UIElements
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var saveChangesLabel: UIButton!
    
}

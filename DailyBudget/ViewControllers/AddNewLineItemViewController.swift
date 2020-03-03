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
        if let name = nameTextField.text,
            let amountString = amountTextField.text,
            let amount = Double(amountString),
            let lic = lineItemController {
                let category = CategoryTypes.allCases[categoryPickerView.selectedRow(inComponent: 0)]
            
                lic.addNewLineItem(itemName: name, category: category, amount: amount, date: Date())
            
            let prevVC = navigationController?.viewControllers[0] as? LineItemTableViewController
            prevVC?.lineItemController = lic
            
        }
//        let numOfVCs = navigationController?.viewControllers.count
        // use the controller method to create and save a new line item
        navigationController?.popViewController(animated: true)
    }
    
    func setUpView() {
        nameTextField.placeholder = "Name of purchase"
        amountTextField.placeholder = "Amount of purchase"
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
    
    // MARK: - UIElements
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
}

//
//  CreateNewExperienceController.swift
//  BoardOnline
//
//  Created by Alexandre on 19/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import UIKit

class CreateNewExperienceController: UITableViewController {
    @IBOutlet var dateBeginTextField: UITextField!
    @IBAction func dateBeginTextFieldEditing(sender: UITextField) {
        var datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("datePickerValueChaned:"), forControlEvents: UIControlEvents.ValueChanged)
    }

}

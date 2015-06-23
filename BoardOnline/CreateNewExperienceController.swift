//
//  CreateNewExperienceController.swift
//  BoardOnline
//
//  Created by Alexandre on 19/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import UIKit

class CreateNewExperienceController: UITableViewController {

    @IBOutlet weak var firstDatePicker: UITextField!
    @IBOutlet weak var secondDatePicker: UITextField!
    
    @IBAction func firstDatePickerEditing(sender: UITextField) {
        var datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("firstDatePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    @IBAction func secondDatePickerEditing(sender: UITextField) {
        var datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("secondDatePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func firstDatePickerValueChanged(sender: UIDatePicker) {
        var dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        firstDatePicker.text = dateformatter.stringFromDate(sender.date)
    }
    
    func secondDatePickerValueChanged(sender: UIDatePicker) {
        var dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        secondDatePicker.text = dateformatter.stringFromDate(sender.date)
    }
}

//
//  ViewController.swift
//  UIKeyboardLikePickerTextField
//
//  Created by Tsif on 12/18/2015.
//  Copyright (c) 2015 Tsif. All rights reserved.
//

import UIKit
import UIKeyboardLikePickerTextField

class ViewController: UIViewController {

    @IBOutlet weak var pickerTextField: UIKeyboardLikePickerTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerTextField.pickerDataSource = ["These", "are", "some", "options"]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


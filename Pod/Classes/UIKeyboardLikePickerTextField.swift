//
//  UIKeyboardLikePickerTextField.swift
//  Gia Ola
//
//  Created by George Tsifrikas on 16/12/15.
//  Copyright © 2015 George Tsifrikas. All rights reserved.
//

import UIKit

class UIKeyboardLikePickerTextField: UITextField, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    static var picker:UIPickerView?
    static var pickerToolbar:UIToolbar?
    static var picketToolbarButton: UIBarButtonItem?
    weak var otherDelegate: UITextFieldDelegate? = nil;
    weak private var parentView:UIView?
    
    override weak var delegate: UITextFieldDelegate? {
        get {
            return self
        }
        set(newDelegate) {
            otherDelegate = newDelegate
        }
    }
    
    var pickerDataSource:[String] = [] {
        didSet {
            focusedOnMe()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.delegate = self
        checkStatus()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        super.delegate = self
        checkStatus()
    }
    
    private func checkStatus() {
        if UIKeyboardLikePickerTextField.picker == nil {
            self.createPicker()
        }
        self.inputAccessoryView = UIKeyboardLikePickerTextField.pickerToolbar
        self.inputView = UIKeyboardLikePickerTextField.picker
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "focusedOnMe", name: UITextViewTextDidBeginEditingNotification, object: nil)
    }
    
    func focusedOnMe() {
        UIKeyboardLikePickerTextField.picker?.dataSource = self
        UIKeyboardLikePickerTextField.picker?.delegate = self
        UIKeyboardLikePickerTextField.picker?.reloadAllComponents()
        if self.text == "" {
            UIKeyboardLikePickerTextField.picker?.selectRow(0, inComponent: 0, animated: false)
        } else {
            var index = 0
            for option in self.pickerDataSource {
                if option == self.text {
                    UIKeyboardLikePickerTextField.picker?.selectRow(index + 1, inComponent: 0, animated: false)
                }
                index++
            }
        }
    }
    
    private func createPicker() {
        var heightOfPicker:CGFloat = 216
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            if UIDevice.currentDevice().orientation == .Portrait || UIDevice.currentDevice().orientation == .PortraitUpsideDown {
                heightOfPicker = 264
            } else {
                heightOfPicker = 352
            }
        } else {
            if UIDevice.currentDevice().orientation == .Portrait || UIDevice.currentDevice().orientation == .PortraitUpsideDown {
                heightOfPicker = 216
            } else {
                heightOfPicker = 162
            }
        }
        heightOfPicker += 20
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        let picker = UIPickerView(frame: CGRectMake(0, screenHeight - heightOfPicker, UIScreen.mainScreen().bounds.size.width, heightOfPicker))
        UIKeyboardLikePickerTextField.picker = picker
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
//        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done".localizedString, style: UIBarButtonItemStyle.Done, target: self, action: "donePressed")
//        var cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "cancelPressed")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        UIKeyboardLikePickerTextField.pickerToolbar = toolBar
        self.inputAccessoryView = toolBar
    }
    
    func donePressed() {
        self.textFieldShouldReturn(self)
    }
    
    //MARK: - text filed self delegate
    func textFieldDidBeginEditing(textField: UITextField){
        otherDelegate?.textFieldDidBeginEditing?(textField);
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        focusedOnMe()
        return otherDelegate?.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return otherDelegate?.textFieldShouldEndEditing?(textField) ?? true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        otherDelegate?.textFieldDidEndEditing?(textField)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return otherDelegate?.textField?(textField, shouldChangeCharactersInRange: range, replacementString: string) ?? true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return otherDelegate?.textFieldShouldClear?(textField) ?? true
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return otherDelegate?.textFieldShouldReturn?(textField) ?? true
    }

    //MARK: - picker delegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDataSource.count + 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = row == 0 ? "" : self.pickerDataSource[row - 1]
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row > 0 ? self.pickerDataSource[row - 1] : ""
    }
}


extension String {
    var localizedString: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
}
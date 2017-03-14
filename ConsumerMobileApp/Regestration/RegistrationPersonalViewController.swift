//
//  RegistrationPersonalViewController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 3/14/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit

class RegistrationPersonalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtDOB: UITextField!
    var datePicker : UIDatePicker!
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSSN: UITextField!
    @IBOutlet weak var txtUserID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func getDateOfBirth(_ sender: UITextField) {
        // DatePicker
        let rect = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150) // CGFloat, Double, Int
        self.datePicker = UIDatePicker(frame:rect)
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        txtDOB.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        //  toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(RegistrationPersonalViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(RegistrationPersonalViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        txtDOB.inputAccessoryView = toolBar
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField ==  txtDOB){
            self.getDateOfBirth(self.txtDOB)
        }
    }
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    
    func doneClick() {
        let dateFormatter1 = DateFormatter()
        //dateFormatter1.dateStyle = .medium
        dateFormatter1.dateFormat = "YYYY-MM-dd"
        
        txtDOB.text = dateFormatter1.string(from: datePicker.date)
        txtDOB.resignFirstResponder()
    }
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    
    func cancelClick() {
        txtDOB.resignFirstResponder()
    }
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.txtFirstName .resignFirstResponder()
        self.txtDOB .resignFirstResponder()
        self.txtEmail .resignFirstResponder()
        self.txtLastName.resignFirstResponder()
        self.txtSSN.resignFirstResponder()
        self.txtMobileNo.resignFirstResponder()
        self.txtUserID.resignFirstResponder()
        
    }
}

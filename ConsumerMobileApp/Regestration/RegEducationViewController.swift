//
//  RegEducationViewController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 3/14/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit

class RegEducationViewController: UIViewController {

    @IBOutlet var pEducationTextField: UITextField!
    @IBOutlet var pYearsFinanicalTextField: UITextField!
    @IBOutlet var pYearsRiskTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationPersonalMoreController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationPersonalMoreController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.pYearsFinanicalTextField .resignFirstResponder()
        self.pYearsRiskTextField .resignFirstResponder()
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        //        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        //            if self.view.frame.origin.y == 0{
        //                self.view.frame.origin.y -= keyboardSize.height
        //            }
        //        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        //        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        //            if self.view.frame.origin.y != 0{
        //                self.view.frame.origin.y += keyboardSize.height
        //            }
        //        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    
    @IBAction func onEducationButtonTapped(_ sender: AnyObject) {
        
        let actionSheet: UIAlertController = UIAlertController(title: "Select Education Level", message: "", preferredStyle: .actionSheet)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            print("Cancel")
        }
        actionSheet.addAction(cancelActionButton)
        
        let firstActionButton: UIAlertAction = UIAlertAction(title: "High School", style: .default)
        { action -> Void in
            self.pEducationTextField.text = "High School"
        }
        actionSheet.addAction(firstActionButton)
        
        let secondButton: UIAlertAction = UIAlertAction(title: "College", style: .default)
        { action -> Void in
            self.pEducationTextField.text = "College"
        }
        actionSheet.addAction(secondButton)
        
        let thirdButton: UIAlertAction = UIAlertAction(title: "University", style: .default)
        { action -> Void in
            self.pEducationTextField.text = "University"
        }
        actionSheet.addAction(thirdButton)
        
        self.present(actionSheet, animated: true, completion: nil)
    
    }

}

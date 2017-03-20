//
//  RegFinancialFirstController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 3/14/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit

class RegFinancialFirstController: UIViewController {

    @IBOutlet var pIncomeTextField: UITextField!
    @IBOutlet var pIncomeInvestField: UITextField!
    @IBOutlet var pHighestInvestField: UITextField!
    @IBOutlet var pBestWorstReturnField: UITextField!
    @IBOutlet var pLowestAmountInvested: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationPersonalMoreController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationPersonalMoreController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.pIncomeTextField .resignFirstResponder()
        self.pIncomeInvestField .resignFirstResponder()
        self.pHighestInvestField.resignFirstResponder()
        self.pBestWorstReturnField .resignFirstResponder()
        self.pLowestAmountInvested.resignFirstResponder()
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
}

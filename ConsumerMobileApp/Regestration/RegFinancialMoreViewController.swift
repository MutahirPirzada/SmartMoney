//
//  RegFinancialMoreViewController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 3/14/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit

class RegFinancialMoreViewController: UIViewController {

    @IBOutlet var pCurrentSavingTextField: UITextField!
    @IBOutlet var pYearsField: UITextField!
    
    @IBOutlet var pYesReplenishIcon: UIImageView!
    @IBOutlet var pNoReplenishIcon: UIImageView!
    
    @IBOutlet var pYesExplainingIcon: UIImageView!
    @IBOutlet var pNoExplainingIcon: UIImageView!
    
    @IBOutlet var pYesDiffIcon: UIImageView!
    @IBOutlet var pNoDiffIcon: UIImageView!
    
    var bReplenish : Bool = true
    var bExplaining : Bool = true
    var bDiffStartUp : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationPersonalMoreController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationPersonalMoreController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.pCurrentSavingTextField .resignFirstResponder()
        self.pYearsField .resignFirstResponder()
        
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

    @IBAction func onReplenishSavingButtonTapped(_ sender: AnyObject) {
        
        let button = sender as! UIButton
        
        if button.tag == 1 {
            
            bReplenish = true
            pYesReplenishIcon.image = UIImage(named: "checked")
            pNoReplenishIcon.image = UIImage(named: "unchecked")
        }
        else {
            bReplenish = false
            pYesReplenishIcon.image = UIImage(named: "unchecked")
            pNoReplenishIcon.image = UIImage(named: "checked")
        }
        
    }
    
    @IBAction func onExplainingButtonTapped(_ sender: AnyObject) {
        let button = sender as! UIButton
        
        if button.tag == 1 {
            
            bExplaining = true
            pYesExplainingIcon.image = UIImage(named: "checked")
            pNoExplainingIcon.image = UIImage(named: "unchecked")
        }
        else {
            bExplaining = false
            pYesExplainingIcon.image = UIImage(named: "unchecked")
            pNoExplainingIcon.image = UIImage(named: "checked")
        }
    }
    
    @IBAction func onDiffStartUpButtonTapped(_ sender: AnyObject) {
        let button = sender as! UIButton
        
        if button.tag == 1 {
            
            bDiffStartUp = true
            pYesDiffIcon.image = UIImage(named: "checked")
            pNoDiffIcon.image = UIImage(named: "unchecked")
        }
        else {
            bExplaining = false
            pYesDiffIcon.image = UIImage(named: "unchecked")
            pNoDiffIcon.image = UIImage(named: "checked")
        }
    }
}

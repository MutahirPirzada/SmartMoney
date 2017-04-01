//
//  SecurityViewController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 3/31/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit

class SecurityViewController: UIViewController, UITextFieldDelegate {

    var accessForClass : String = ""
    
    @IBOutlet weak var txtOne: UITextField!
    @IBOutlet weak var txtTwo: UITextField!
    @IBOutlet weak var txtThree: UITextField!
    @IBOutlet weak var txtFive: UITextField!
    @IBOutlet weak var txtFour: UITextField!
    @IBOutlet weak var txtSix: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //
        super.viewDidAppear(animated)
        
        resetViewForFreshEntry()
    }
    
    func resetViewForFreshEntry () {
        
        self.txtOne.text = ""
        self.txtTwo.text = ""
        self.txtThree.text = ""
        self.txtFour.text = ""
        self.txtFive.text = ""
        self.txtSix.text = ""
        
    }
    
    //
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
        
    {
        let newString = ((textField.text)! as NSString).replacingCharacters(in: range, with: string)
        //     let newString = ((textField.text)! as NSString).stringByReplacingCharactersInRange(range, withString: string)// Convert text into NSString in order to use 'stringByReplacingCharactersInRange' function
        
        let newLength = newString.characters.count  // Count the length of 'String' type variable
        
        
        if(string != "") {
            if (textField == txtOne) {
                
                if (newLength == 1) {
                    
                    txtOne.text = newString
                    
                    txtTwo.becomeFirstResponder()
                    return false
                }
                else
                {
                    
                    txtTwo.text = string
                    txtThree.becomeFirstResponder()
                    // return true
                }
                
            }
            
            if (textField == txtTwo) {
                
                if (newLength == 1) {
                    
                    txtTwo.text = newString
                    txtThree.becomeFirstResponder()
                    //  return false
                }
                else
                {
                    
                    txtThree.text = string
                    txtFour.becomeFirstResponder()
                    //   return true
                }
            }
            
            if (textField == txtThree) {
                
                if (newLength == 1) {
                    
                    txtThree.text = newString
                    txtFour.becomeFirstResponder()
                    return false
                }
                else
                {
                    
                    txtFour.text = string
                    txtFive.becomeFirstResponder()
                    //return true
                }
            }
            if (textField == txtFour) {
                
                if (newLength == 1) {

                    txtFour.text = newString
                    txtFive.becomeFirstResponder()
                    return false
                }
                else
                {
                    
                    txtFive.text = string
                    txtSix.becomeFirstResponder()
                    //                    return true
                }
            }
            if (textField == txtFive) {
                
                if (newLength == 1) {

                    txtFive.text = newString
                    txtSix.becomeFirstResponder()
                    //return false
                }
                    
                else
                {
                    txtSix.text = string
                    // return true
                }
                
            }
            if (textField == txtSix) {
                if (newLength == 1) {
                    
                    txtSix.text = newString
                    return false
                    
                }
                else if (string == "" && newLength == 0)
                {
                    txtSix.text = ""
                    txtFive .becomeFirstResponder()
                    return true
                }
            }
            
        }
        else {
            if (textField == txtSix) {
                txtSix.text = ""
                txtFive .becomeFirstResponder()
            }
            if (textField == txtFive) {
                txtFive.text = ""
                txtFour .becomeFirstResponder()
            }
            if (textField == txtFour) {
                txtFour.text = ""
                txtThree .becomeFirstResponder()
            }
            if (textField == txtThree) {
                txtThree.text = ""
                txtTwo .becomeFirstResponder()
            }
            if (textField == txtTwo) {
                txtTwo.text = ""
                txtOne .becomeFirstResponder()
            }
            if (textField == txtOne) {
                txtOne.text = ""
                // txtOne .becomeFirstResponder()
            }
        }
        
        return false
    }
    
    
    @IBAction func confirmButtonClicked(_ sender: Any) {
        
        let code = self.txtOne.text! + self.txtTwo.text! + self.txtThree.text! + self.txtFour.text! + self.txtFive.text! + self.txtSix.text!
        
        if code == "123123" {
            
            
            if accessForClass == "edit_profile" {
                
                let editProfileVC = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
                self.navigationController?.pushViewController(editProfileVC, animated: true)
            }
            else if accessForClass == "risk_profile" {
                
                let riskProfileVC = self.storyboard?.instantiateViewController(withIdentifier: "RiskProfileViewController") as! RiskProfileViewController
                self.navigationController?.pushViewController(riskProfileVC, animated: true)
            }
            else if accessForClass == "parental_control" {
                let riskProfileVC = self.storyboard?.instantiateViewController(withIdentifier: "ParentalControlViewController") as! ParentalControlViewController
                self.navigationController?.pushViewController(riskProfileVC, animated: true)
            }
            
        }
        else {
            
            self.errorMessage.text = "Wrong code"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

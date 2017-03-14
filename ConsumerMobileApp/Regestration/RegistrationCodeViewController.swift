//
//  RegistrationCodeViewController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 3/14/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit

class RegistrationCodeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtOne: UITextField!
    @IBOutlet weak var txtTwo: UITextField!
    @IBOutlet weak var txtThree: UITextField!
    @IBOutlet weak var txtFive: UITextField!
    @IBOutlet weak var txtFour: UITextField!
    @IBOutlet weak var txtSix: UITextField!
    
    @IBOutlet weak var retxtOne: UITextField!
    @IBOutlet weak var retxtTwo: UITextField!
    @IBOutlet weak var retxtThree: UITextField!
    @IBOutlet weak var retxtFive: UITextField!
    @IBOutlet weak var retxtFour: UITextField!
    @IBOutlet weak var retxtSix: UITextField!
    
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
                    retxtOne.becomeFirstResponder()
                    return false
                    
                }
                else if (string == "" && newLength == 0)
                {
                    txtSix.text = ""
                    txtFive .becomeFirstResponder()
                    return true
                }
            }
            
            if (textField == retxtOne)  {
                
                if (newLength == 1) {
                    
                    retxtOne.text = newString
                    retxtTwo.becomeFirstResponder()
                    return false
                }
                else
                {
                    
                    retxtTwo.text = string
                    retxtThree.becomeFirstResponder()
                    // return true
                }
                
            }
            
            if (textField == retxtTwo) {
                
                if (newLength == 1) {
                    retxtTwo.text = newString
                    retxtThree.becomeFirstResponder()
                    //  return false
                }
                else
                {
                    
                    retxtThree.text = string
                    retxtFour.becomeFirstResponder()
                    //   return true
                }
            }
            
            if (textField == retxtThree) {
                
                if (newLength == 1) {
                    
                    retxtThree.text = newString
                    retxtFour.becomeFirstResponder()
                    return false
                }
                else
                {
                    
                    retxtFour.text = string
                    retxtFive.becomeFirstResponder()
                    //return true
                }
            }
            if (textField == retxtFour) {
                
                if (newLength == 1) {
                    
                    retxtFour.text = newString
                    retxtFive.becomeFirstResponder()
                    return false
                }
                else
                {
                    
                    retxtFive.text = string
                    retxtSix.becomeFirstResponder()
                    //                    return true
                }
            }
            if (textField == retxtFive) {
                
                if (newLength == 1) {
                    retxtFive.text = newString
                    retxtSix.becomeFirstResponder()
                    //return false
                }
                    
                else
                {
                    retxtSix.text = string
                    // return true
                }
                
            }
            if (textField == retxtSix) {
                if (newLength == 1) {
                    
                    retxtSix.text = newString
                    
                    return false
                    
                }
                else if (string == "" && newLength == 0)
                {
                    retxtSix.text = ""
                    retxtFive .becomeFirstResponder()
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
            
            if (textField == retxtSix) {
                retxtSix.text = ""
                retxtFive .becomeFirstResponder()
            }
            if (textField == retxtFive) {
                retxtFive.text = ""
                retxtFour .becomeFirstResponder()
            }
            if (textField == retxtFour) {
                retxtFour.text = ""
                retxtThree .becomeFirstResponder()
            }
            if (textField == txtThree) {
                retxtThree.text = ""
                retxtTwo .becomeFirstResponder()
            }
            if (textField == retxtTwo) {
                retxtTwo.text = ""
                retxtOne .becomeFirstResponder()
            }
            if (textField == retxtOne) {
                retxtOne.text = ""
                // txtOne .becomeFirstResponder()
            }
        }
        
        return false
    }

}

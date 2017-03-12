//
//  ViewController.swift
//  ConsumerMobileApp
//
//  Created by Usman Nisar on 22/11/2016.
//  Copyright © 2016 Usman. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController , UITextFieldDelegate
{

    @IBOutlet weak var txtOne: UITextField!
    @IBOutlet weak var txtTwo: UITextField!
    @IBOutlet weak var txtThree: UITextField!
    @IBOutlet weak var txtFive: UITextField!
    @IBOutlet weak var txtFour: UITextField!
    @IBOutlet weak var txtSix: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var txtphonenumber: UITextField!

    @IBOutlet weak var btnLogin: UIButton!

    override func viewDidLoad() {

        // Define identifier
        let notificationIdentifier: String = "UITextFieldTextDidChange"

        // Register to receive notification
        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.textFieldNotification(notification:)), name: NSNotification.Name(notificationIdentifier), object: nil)

        // Post a notification

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.txtphonenumber.text = "3125700062"
        self.txtOne.text = "1"
        self.txtTwo.text = "2"
        self.txtThree.text = "3"
        self.txtFour.text = "1"
        self.txtFive.text = "2"
        self.txtSix.text = "3"

    }




    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    //    {
    //
    //        return true
    //    }
    //
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool

    {
        let newString = ((textField.text)! as NSString).replacingCharacters(in: range, with: string)
        //     let newString = ((textField.text)! as NSString).stringByReplacingCharactersInRange(range, withString: string)// Convert text into NSString in order to use 'stringByReplacingCharactersInRange' function

        let newLength = newString.characters.count  // Count the length of 'String' type variable
        var strText = newString

        if(string != "") {
            if (textField == txtOne) {
                
                if (newLength == 1) {
                    
                    txtOne.text = newString
                    strText = ""
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
                    strText = ""
                    
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
                    strText = ""
                    
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
                    strText = ""
                    
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
                    strText = ""
                    
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

    func textFieldNotification (notification: NSNotification)
    {
        print("working")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        sendDataToServer()
    }
    
    @IBAction func btnReset(_ sender: Any) {
        let RegVC = self.storyboard?.instantiateViewController(withIdentifier: "reg") as! RegistrationViewController
        self.navigationController?.present(RegVC, animated: true)
    }
    
    func sendDataToServer()
    {
        let code = self.txtOne.text! + self.txtTwo.text! + self.txtThree.text! + self.txtFour.text! + self.txtFive.text! + self.txtSix.text!
        let params:NSMutableDictionary = ["phone_number": self.txtphonenumber.text as String!,
                                          "code":code];
        
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            APIManager.requestServerWithJSONData(requestCall: "login", requestMehtod: "POST", data: jsonData ,completionHandler: { (responseDictionary, error) in
                
                
                if(error != nil)
                {
                    print("error: \(error?.localizedDescription)")
                }
                else
                {
                    if((responseDictionary?["json"]) != nil)
                    {
                        let result = responseDictionary?["json"] as! NSDictionary
                        // print("responseString: \(result["message"])")
                        
                        let result_code = result.object(forKey: "result") as? String
                        
                        if result_code == "ok" {
                            
                            let userdefault = UserDefaults.standard
                            userdefault.set(self.txtphonenumber.text, forKey: "phoneNumber")
                            userdefault.synchronize()
                            
                            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "home") as! HomeViewController
                            self.navigationController?.pushViewController(homeVC, animated: true)
                        }
                        else {
                            let result_string = result.object(forKey: "result_string") as? String
                            self.errorMessage.text = "Error: " + result_string!
                            
                        }
                    }
                }
                
            })
            
        }
        catch {
            print(error.localizedDescription)
        }
    }
}


//
//  RegistrationViewController.swift
//  Nano Invest
//
//  Created by Brilliant-005 on 12/24/16.
//  Copyright © 2016 Usman. All rights reserved.
//

import UIKit
import Alamofire

//class RegistrationViewController: UIViewController , UITextFieldDelegate {
class RegistrationViewController: UIViewController , UITextFieldDelegate {
    var gradientLayer: CAGradientLayer!
    @IBOutlet weak var topView: UIView!

    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    @IBOutlet weak var txtFirstName: UITextField!

    @IBOutlet weak var txtDOB: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var onGenderTapped: UIButton!

    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMiddleName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    var datePicker : UIDatePicker!
    var strGender : String!
    var strSalutation: String!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var onSalutationTapped: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator .isHidden = true
        strSalutation = "" as String!
        strGender = "" as String!
        self.topView.layer.cornerRadius = CGFloat(8.0)
        self.bodyView.layer.cornerRadius = CGFloat(8.0)

        self.bodyView.layer.masksToBounds = true
        self.topView.layer.masksToBounds = true

        self.bodyView.layer.borderColor = UIColor.green.cgColor
        self.topView.layer.borderColor = UIColor.green.cgColor

        txtDOB.inputView = datePicker
        // Do any additional setup after loading the view.
    }
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

    func createGradientLayer() {
        gradientLayer = CAGradientLayer()

        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.green.cgColor, UIColor.yellow.cgColor,UIColor.green.cgColor ]

        self.view.layer.addSublayer(gradientLayer)
    }
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.txtFirstName .resignFirstResponder()
        self.txtDOB .resignFirstResponder()
        self.txtEmail .resignFirstResponder()
        self.txtLastName.resignFirstResponder()
        self.txtMiddleName.resignFirstResponder()
        self.txtMobileNo.resignFirstResponder()
        self.txtAddress.resignFirstResponder()

    }

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

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
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(RegistrationViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(RegistrationViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        txtDOB.inputAccessoryView = toolBar
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
    @IBAction func onSalutationTapped(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Salutation", preferredStyle: .actionSheet)

        // 2
        let first = UIAlertAction(title: "1", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.strSalutation = "1"
            self.onSalutationTapped.setTitle(self.strSalutation,for: .normal)
        })
        let second = UIAlertAction(title: "2", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.strSalutation = "2"
            self.onSalutationTapped.setTitle(self.strSalutation,for: .normal)

        })
        //
        let third = UIAlertAction(title: "3", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.strSalutation = "3"
            self.onSalutationTapped.setTitle(self.strSalutation,for: .normal)

        })
        //
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })


        // 4
        optionMenu.addAction(first)
        optionMenu.addAction(second)
        optionMenu.addAction(third)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

    @IBAction func onGenderTapped(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Salutation", preferredStyle: .actionSheet)

        // 2
        let first = UIAlertAction(title: "Male", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.strGender = "Male"
            self.onGenderTapped.setTitle(self.strGender,for: .normal)


        })
        let second = UIAlertAction(title: "Female", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.strGender = "Female"
            self.onGenderTapped.setTitle(self.strGender,for: .normal)

        })

        //
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        // 4
        optionMenu.addAction(first)
        optionMenu.addAction(second)
        optionMenu.addAction(cancelAction)

        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

    @IBAction func btnSignUp(_ sender: Any) {
        if((self.txtMobileNo.text?.characters.count)! < 10)
        {
            let alertController = UIAlertController(title: "Error", message: "The mobile number must contain atleast ten digits", preferredStyle: .alert)

            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)

            present(alertController, animated: true, completion: nil)
        }
        else if !(txtEmail.text?.isEmail())! {

            let alertController = UIAlertController(title: "Error", message: "The email format is incorrect", preferredStyle: .alert)

            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)

            present(alertController, animated: true, completion: nil)
        }
        else if(strGender .isEmpty || strSalutation .isEmpty)
        {
            let alertController = UIAlertController(title: "Error", message: "Please choose salutation and Gender", preferredStyle: .alert)

            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)

            present(alertController, animated: true, completion: nil)
        }
        else if self.txtAddress.text?.characters.count == 0 || self.txtDOB.text?.characters.count == 0 || self.txtEmail.text?.characters.count == 0 || self.txtLastName.text?.characters.count == 0 || self.txtMobileNo.text?.characters.count == 0 || self.txtFirstName.text?.characters.count == 0 || self.txtAddress.text?.characters.count == 0
        {
            let alertController = UIAlertController(title: "Error", message: "Please fill all the fields", preferredStyle: .alert)

            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)

            present(alertController, animated: true, completion: nil)
        }
        else
        {
            sendDataToServer()
        }
    }


    func sendDataToServer()
    {
        self.indicator .isHidden = false

        let params:NSMutableDictionary = ["firstName": self.txtFirstName.text as String!,
                                          "middleName":self.txtMiddleName.text as String!,
                                          "dateOfBirth":self.txtDOB.text as String!,
                                          "address":self.txtAddress.text as String!,
                                          "email":self.txtEmail.text as String!,
                                          "mobileNo":self.txtMobileNo.text as String!,
                                          "salutation": self.strSalutation as String!,
                                          "lastName":self.txtLastName.text as String!,
                                          "gender":self.strGender as String!    ];

        do {

            let jsonData = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)

            APIManager.requestServerWithJSONData(requestCall: "consumer", requestMehtod: "POST", data: jsonData ,completionHandler: { (responseDictionary, error) in


                if(error != nil)
                {
                    print("error: \(error?.localizedDescription)")
                    self.indicator .isHidden = true

                }
                else
                {
                    if((responseDictionary?["json"]) != nil)
                    {
                        let result = responseDictionary?["json"] as! NSDictionary
                        // print("responseString: \(result["message"])")

                        let result_code = result.object(forKey: "result_code") as! NSNumber

                        if result_code.intValue != 400 {
                            self.indicator .isHidden = true

                            let alert = UIAlertController.init(title: "SmartMoney.co", message: result.object(forKey: "result_string") as? String, preferredStyle: .alert)

                            let cancel = UIAlertAction.init(title: "Ok", style: .cancel, handler: { (action) in
                                //
                                self.dismiss(animated: true, completion: nil)
                                self.indicator .isHidden = true

                            })

                            alert.addAction(cancel)
                            self.indicator .isHidden = true

                            self.present(alert, animated: true, completion:nil)
                        }
                    }
                }

            })

        }
        catch {
            print(error.localizedDescription)
            self.indicator .isHidden = true

        }
    }


    @IBAction func btnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField ==  txtDOB){
        self.getDateOfBirth(self.txtDOB)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {

    }


}
extension String
{
    func isEmail() -> Bool
    {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}

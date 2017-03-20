//
//  RegFinancialGoalViewController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 3/14/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit

class RegFinancialGoalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var pNumberOfEventField: UITextField!
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var pFirstLifeEventField: UITextField!
    @IBOutlet var pFirstAmountField: UITextField!
    @IBOutlet var pFirstYearField: UITextField!
    
    @IBOutlet var pSecondLifeEventField: UITextField!
    @IBOutlet var pSecondAmountField: UITextField!
    @IBOutlet var pSecondYearField: UITextField!
    
    @IBOutlet var pOtherEventsTextField: UITextField!
    
    @IBOutlet var constraintPickerYPos: NSLayoutConstraint!
    
    var pNumberOfEventsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for i in 0...20 {
            pNumberOfEventsArray.append(String(i))
        }
        
        self.constraintPickerYPos.constant = -270
        
        pickerView.reloadAllComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.pFirstLifeEventField .resignFirstResponder()
        self.pFirstYearField .resignFirstResponder()
        self.pFirstAmountField.resignFirstResponder()
        self.pSecondYearField .resignFirstResponder()
        self.pSecondAmountField.resignFirstResponder()
        self.pSecondLifeEventField .resignFirstResponder()
        self.pOtherEventsTextField.resignFirstResponder()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onClickSelectEventsButton(_ sender: AnyObject) {
        
        if constraintPickerYPos.constant == 0 {
            
            UIView.animate(withDuration: 0.5, animations: { 
                //
                self.constraintPickerYPos.constant = -270
                
                self.view.layoutIfNeeded()
            })
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                //
                self.constraintPickerYPos.constant = 0
                
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func onClickPickerCancel(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.5, animations: {
            //
            self.constraintPickerYPos.constant = -270
            
            self.view.layoutIfNeeded()
        })
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pNumberOfEventsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
        self.pNumberOfEventField.text = pNumberOfEventsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pNumberOfEventsArray[row]
    }
    
    
}

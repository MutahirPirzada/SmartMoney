//
//  SettingsViewController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 3/28/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var pLanguageTextField: UITextField!
    @IBOutlet var pCurrencyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.menuLeadingConstraint.constant = -84
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let secureVC = segue.destination as? SecurityViewController {
            secureVC.accessForClass = segue.identifier!
        }
    }
    

    @IBAction func onClickbtnMenu(_ sender: AnyObject) {
        
        var nLeading = 0
        if self.menuLeadingConstraint.constant == 0 {
            nLeading = -84
        }
        else {
            nLeading = 0
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            
            self.menuLeadingConstraint.constant = CGFloat(nLeading)
            self.view.layoutSubviews()
            
        }, completion: {
            (value: Bool) in
            
            
        })
        
        
    }
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    
    @IBAction func onLanguageClicked(_ sender: AnyObject) {
        
        let actionSheet: UIAlertController = UIAlertController(title: "Select a Language", message: "", preferredStyle: .actionSheet)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            print("Cancel")
        }
        actionSheet.addAction(cancelActionButton)
        
        let firstActionButton: UIAlertAction = UIAlertAction(title: "English", style: .default)
        { action -> Void in
            self.pLanguageTextField.text = "English"
        }
        actionSheet.addAction(firstActionButton)
        
        let secondButton: UIAlertAction = UIAlertAction(title: "French", style: .default)
        { action -> Void in
            self.pLanguageTextField.text = "French"
        }
        actionSheet.addAction(secondButton)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    
    @IBAction func onCurrencyButtonTapped(_ sender: AnyObject) {
        
        let actionSheet: UIAlertController = UIAlertController(title: "Select a Currency", message: "", preferredStyle: .actionSheet)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            print("Cancel")
        }
        actionSheet.addAction(cancelActionButton)
        
        let firstActionButton: UIAlertAction = UIAlertAction(title: "CAD", style: .default)
        { action -> Void in
            self.pCurrencyTextField.text = "CAD"
        }
        actionSheet.addAction(firstActionButton)
        
        let secondButton: UIAlertAction = UIAlertAction(title: "USD", style: .default)
        { action -> Void in
            self.pCurrencyTextField.text = "USD"
        }
        actionSheet.addAction(secondButton)
        self.present(actionSheet, animated: true, completion: nil)
    }
}

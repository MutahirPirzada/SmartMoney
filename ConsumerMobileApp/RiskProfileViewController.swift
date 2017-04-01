//
//  RiskProfileViewController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 4/1/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit

class RiskProfileViewController: UIViewController {

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

    @IBAction func onBackButtonTapped(_ sender: AnyObject) {
        
        let viewsList = self.navigationController?.viewControllers
        self.navigationController?.popToViewController((viewsList?[(viewsList?.count)! - 3])!, animated: true)
    }
}

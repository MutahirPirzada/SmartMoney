//
//  QRCodeViewController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 3/3/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit
import QRCode

class QRCodeViewController: UIViewController {

    @IBOutlet weak var qrCodeImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let phoneNumber = UserDefaults.standard.value(forKey: "phoneNumber") as! String
        
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue(phoneNumber, forKey: "phone")
        
        var jsonString = ""
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
            
            jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
            
            let qrCode = QRCode(jsonString)
            
            let qrImage = qrCode?.image
            
            qrCodeImageView.image = qrImage
            
        } catch {
            print(error.localizedDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnCancel(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
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

//
//  RegistrationIDViewController.swift
//  Nano Invest
//
//  Created by Usman Nisar on 3/14/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit

class RegistrationIDViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoIDImageView: UIImageView!
    @IBOutlet weak var selfieImageView: UIImageView!
    @IBOutlet weak var scanImageView: UIImageView!
    
    var bSelfieImage : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makeRoundedView(view: selfieImageView.superview!, size: 45)
        makeRoundedView(view: scanImageView.superview!, size: 35)
    }
    
    func makeRoundedView(view:UIView, size:CGFloat) {
        view.layer.cornerRadius = size
        view.layer.masksToBounds = true
        
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 2.0
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

    @IBAction func onClickSelfieButton(_ sender: Any) {
        
        bSelfieImage = true
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onClickPhotoIDButton(_ sender: Any) {
        
        bSelfieImage = false
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onClickScanButton(_ sender: Any) {
    }
    
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var imageChosen : UIImage? = nil
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            imageChosen = pickedImage
        }
        else if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageChosen = pickedImage
        }
        
        if bSelfieImage {
            selfieImageView.image = imageChosen!
        }
        else {
            photoIDImageView.image = imageChosen!
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}

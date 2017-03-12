//
//  HomeViewController.swift
//  ConsumerMobileApp
//
//  Created by Whizpool Developer on 11/24/16.
//  Copyright © 2016 Usman. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var sideView: UIView!
    let tag: Bool = true

    @IBOutlet weak var imgBg: UIImageView!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var btnMenu: UIButton!

    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!

    @IBOutlet weak var imgHands: UIImageView!
    @IBOutlet weak var menuView: UIView!



    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.menuView.backgroundColor = UIColor(patternImage: UIImage(named: "menubg.png")!)
        self.userProfileImage.layer.cornerRadius = self.userProfileImage.frame.size.width/2
        self.userProfileImage.layer .masksToBounds = true
        
        self.menuView.layer.cornerRadius = 5.0
        self.menuView.layer.masksToBounds = true

        self.menuLeadingConstraint.constant = -84
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
//        swipeRight.direction = UISwipeGestureRecognizerDirection.right
//        self.view.addGestureRecognizer(swipeRight)
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeDown)
    }

    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")

                

            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }


    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar .isHidden = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        

        
    }

    @IBAction func onQRButtonTapped(_ sender: Any) {
    }
    @IBAction func onBluetoothButtonTapped(_ sender: Any) {
    }
    @IBAction func onNfcButtonTapped(_ sender: Any) {
    }

    @IBAction func btnMenu(_ sender: Any) {

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

    @IBAction func onNewButtonTapped(_ sender: Any) {
        
        btnMenu(sender)
    }


    @IBAction func onGoldButtonTapped(_ sender: Any) {

        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "account") as! AccountViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)

    }

    @IBAction func onStatsButtonTapped(_ sender: Any) {
    }

    @IBAction func onSettingsButtonTapped(_ sender: Any) {
    }


    @IBAction func onFlashButtonTapped(_ sender: Any) {
    }


    @IBAction func onLogoutButton(_ sender: Any) {
    }


    @IBAction func onMessageButtonTapped(_ sender: Any) {
    }
}

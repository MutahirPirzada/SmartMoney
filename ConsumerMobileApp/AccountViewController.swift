//
//  AccountViewController.swift
//  ConsumerMobileApp
//
//  Created by Brilliant-005 on 11/28/16.
//  Copyright © 2016 Usman. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    var isGraphViewShowing = false
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!

//    @IBOutlet weak var menuView: UIView!
//    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var viewForButtons: UIView!
    @IBOutlet weak var tblAccount: UITableView!
    @IBOutlet weak var btnDay: UIButton!
    @IBOutlet weak var btnWeek: UIButton!
    @IBOutlet weak var btnMonth: UIButton!
    @IBOutlet weak var btnYear: UIButton!

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var imgChart: UIImageView!
    @IBOutlet weak var btnCreditOne: UIButton!

    @IBOutlet weak var btnCreditThree: UIButton!
    @IBOutlet weak var btnCreditTwo: UIButton!
    @IBOutlet weak var labelVeiw: UIView!
    
    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
    
var imageV = UIImageView()
    var datesArr: [String] = ["Sept 11", "Sept 12", "Sept 13","Sept 14","Sept 11", "Sept 12", "Sept 13","Sept 11", "Sept 12", "Sept 13"]
    var amountArr: [String] = ["Daily Average ($4.50) + $2.00", "Daily Average ($4.50) - $1.75", "Daily Average ($4.50) - $1.75", "Daily Average ($4.50) - $0.30","Daily Average ($4.50) + $2.00", "Daily Average ($4.50) - $1.75", "Daily Average ($4.50) - $1.75","Daily Average ($4.50) + $2.00", "Daily Average ($4.50) - $1.75", "Daily Average ($4.50) - $1.75"]
    var descArr: [String] = ["$6.50", "$2.25", "$5.00","$4.20","$6.50", "$2.25", "$5.00","$6.50", "$2.25", "$5.00"]

    override func viewDidLoad() {
        
        self.menuLeadingConstraint.constant = -84
        
        self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.width/2
        self.imgProfile.layer .masksToBounds = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOnImg))
        tapGesture.numberOfTapsRequired = 1
      //  imgChart .addGestureRecognizer(tapGesture)
//        self.menuView .isHidden = true
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.left

        self.view.addGestureRecognizer(swipeDown)
        self.view.addGestureRecognizer(swipeRight)

        self.labelVeiw.layer.cornerRadius = 3
        self.view.layer.borderColor = UIColor.red.cgColor
        self.labelVeiw.clipsToBounds = true
        super.viewDidLoad()

        btnCreditOne.backgroundColor = UIColor (colorLiteralRed: 64/255, green: 133/255, blue: 222/255, alpha: 1)
        btnCreditTwo.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)

        btnCreditThree.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    func tapOnImg(gesture: UIGestureRecognizer)
    {

        let imageName = "bigChart.png"
        let image = UIImage(named: imageName)
        imageV = UIImageView(image: image!)
        imageV.center = self.view.center
        let rect = CGRect(x: 20, y: self.view.frame.height/3, width: self.view.frame.width - 40, height: 150) // CGFloat, Double, Int
        imageV.frame = rect
        view .addSubview(imageV)
        imageV .isHidden = false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        imageV .isHidden = true

    }
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
//                self.menuBtn .isHidden = true
//                self.menuView .isHidden = false
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")

//                self.menuBtn .isHidden = false
//                self.menuView .isHidden = true

            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    @IBAction func onClickMenuButton(_ sender: AnyObject) {
        
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


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnYear(_ sender: Any) {

        btnYear.backgroundColor = UIColor (colorLiteralRed: 64/255, green: 133/255, blue: 222/255, alpha: 1)
        btnDay.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnWeek.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnMonth.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)


        //   64 133 222
        //  3 13 78
    }

    @IBAction func btnMonth(_ sender: Any) {

        btnYear.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnWeek.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnDay.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnMonth.backgroundColor = UIColor (colorLiteralRed: 64/255, green: 133/255, blue: 222/255, alpha: 1)

    }

    @IBAction func btnWeek(_ sender: Any) {
        btnYear.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnDay.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)

        btnMonth.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnWeek.backgroundColor = UIColor (colorLiteralRed: 64/255, green: 133/255, blue: 222/255, alpha: 1)

    }

    @IBAction func btnDaily(_ sender: Any) {
        btnYear.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnMonth.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnWeek.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnDay.backgroundColor = UIColor (colorLiteralRed: 64/255, green: 133/255, blue: 222/255, alpha: 1)
    }
    
    
    @IBAction func onNewButtonTapped(_ sender: Any) {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "home") as! HomeViewController
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    @IBAction func btnCreditOne(_ sender: Any) {
        //        64,133,222
        //        44,53,67
        btnCreditOne.backgroundColor = UIColor (colorLiteralRed: 64/255, green: 133/255, blue: 222/255, alpha: 1)
        btnCreditThree.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnCreditTwo.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)

    }

    @IBAction func btnCreditTwo(_ sender: Any) {
        btnCreditThree.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnCreditOne.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)
        btnCreditTwo.backgroundColor = UIColor (colorLiteralRed: 64/255, green: 133/255, blue: 222/255, alpha: 1)
    }
    @IBAction func btnCreditThree(_ sender: Any) {
        btnCreditOne.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)

        btnCreditTwo.backgroundColor = UIColor (colorLiteralRed: 3/255, green: 13/255, blue: 78/255, alpha: 1)

        btnCreditThree.backgroundColor = UIColor (colorLiteralRed: 64/255, green: 133/255, blue: 222/255, alpha: 1)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datesArr.count;
    }
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
  
    {
        if indexPath.row % 2 == 0  {
            cell.backgroundColor = UIColor (colorLiteralRed: 189/255, green: 189/255, blue: 189/255, alpha: 1)

        }
        else
        {
            cell.backgroundColor = UIColor .white
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:customAccountCell = self.tblAccount.dequeueReusableCell(withIdentifier: "cell") as! customAccountCell
     //   cell.lblDate.transform = CGAffineTransformMakeRotation( ( 90 * M_PI ) / 180 );
     //   cell.lblDate.transform = CGAffineTransform (rotationAngle:90 * M_PI )


        cell.lblDate.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))

        cell.lblDate.text = datesArr[indexPath.row]
        cell.lblDescription .sizeToFit()
        cell.lblDescription.text = amountArr[indexPath.row]
        cell.lblAmount .sizeToFit()
        cell.lblAmount.text = descArr[indexPath.row]
        
        return cell
    }

   }

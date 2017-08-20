//
//  SignupVC.swift
//  Wagespoon
//
//  Created by Ravi Kant Chadda on 03/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import Alamofire

class SignupVC: BaseVC {
    
    //All Xib Objects
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnEmployeer: UIButton!
    @IBOutlet weak var btnEmployee: UIButton!
    @IBOutlet weak var imgViewEmployer: UIImageView!
    @IBOutlet weak var imgViewEmployee: UIImageView!
    
    //All Class Objects

 
    
    
    // MARK: - UIView Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //Method call to initialize view
        intializeView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - initializeView Methods
    func intializeView(){
        
        //Change Status Bar color
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        //Set navigationbar to Clear-Color
        self.setNavigationBar(typeNavigation: .ClearNavigationType)
        
        //Set UItextfield Properties
        txtFullName.attributedPlaceholder = NSAttributedString(string: "Full Name*",
                                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Email Address*",
                                                            attributes: [NSForegroundColorAttributeName: UIColor.white])
        txtConfirmPassword.attributedPlaceholder = NSAttributedString(string: "Confirm Password*",
                                                                      attributes: [NSForegroundColorAttributeName: UIColor.white])
        txtPassword.attributedPlaceholder = NSAttributedString(string: "Password*",
                                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
    
        txtFullName.setLeftPadding(padding: 20,size: 12)
        txtEmail.setLeftPadding( padding: 20,size: 12)
        txtPassword.setLeftPadding(padding: 20,size: 12)
        txtConfirmPassword.setLeftPadding(padding: 20,size: 12)
        
        btnEmployee.setTitleColor(UIColor.lightGray, for: .normal)
        imgViewEmployee.image = UIImage(named: "empolyeehilightedicon")
        Constants.isEmployee = true
     
    }
    
    // MARK: - IBActions
    @IBAction func actionToGetStarted(_ sender: Any) {
        
        let email = txtEmail.text
        let name = txtFullName.text
        let password = txtPassword.text
        let confirmPassword = txtConfirmPassword.text
        
        
        if email == "" {
            Common.showHUD("Please input email", 1.0)
            return
        }
        
        if name == "" {
            Common.showHUD("Please input name", 1.0)
            return
        }
        
        if password == "" {
            Common.showHUD("Please input password", 1.0)
            return
        }
        
        if confirmPassword == "" {
            Common.showHUD("Please input confirm password", 1.0)
            return
        }
        
       
        
        
        UserDefaults.standard.setValue(email, forKey: "email")
        UserDefaults.standard.setValue(password, forKey: "password")
        UserDefaults.standard.set(Constants.isEmployee, forKey: "UserType")
        
        register()
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func actionWithEmployeer(_ sender: Any) {
        
        // If Employee is selected yet than unselect
        if Constants.isEmployee == true{
            btnEmployee.setTitleColor(UIColor.white, for: .normal)
            imgViewEmployee.image = UIImage(named: "employeeicon")
            Constants.isEmployee = false
        }
        
        //Logic to check Select Employer or Not
        if Constants.isEmployer == true{
            btnEmployeer.setTitleColor(UIColor.white, for: .normal)
            imgViewEmployer.image = UIImage(named: "employericon")
            Constants.isEmployer = false
        }else{
            btnEmployeer.setTitleColor(UIColor.lightGray, for: .normal)
            imgViewEmployer.image = UIImage(named: "empolyerhilightedicon")
            Constants.isEmployer = true
        }
        
    }
    
    @IBAction func actionWithEmployee(_ sender: Any) {
        
        // If Employer is selected yet than unselect
        if Constants.isEmployer == true{
            btnEmployeer.setTitleColor(UIColor.white, for: .normal)
            imgViewEmployer.image = UIImage(named: "employericon")
            Constants.isEmployer = false
        }
        
        //Logic to check Select Employee or Not
        if Constants.isEmployee == true{
            btnEmployee.setTitleColor(UIColor.white, for: .normal)
            imgViewEmployee.image = UIImage(named: "employeeicon")
            Constants.isEmployee = false
        }else{
            
            btnEmployee.setTitleColor(UIColor.lightGray, for: .normal)
            imgViewEmployee.image = UIImage(named: "empolyeehilightedicon")
            Constants.isEmployee = true
        }
        
    }

    
    func register() -> Void {
        
        let parameters: Parameters = ["email": self.txtEmail.text!,
                                      "password": self.txtPassword.text!,
                                      "name": self.txtFullName.text!,
                                      "user_type": (Constants.isEmployee ? Constants.UserType.EMPLOYEE : Constants.UserType.EMPLOYER)
                                     ]
        print(parameters)
        Alamofire.request(Constants.HTTP.HOST+Constants.HTTP.RegisterUrl, method: .post, parameters: parameters).responseJSON { (response:DataResponse) in
            
            if let _ = Common.dealResult(response) {
                  Common.showHUD("Sign Up Success!", 1.5)
                  self.stopHud()
                
                }
               self.registerSuccess()
            }
    }
    
    func registerSuccess(){
        let signUpVC: ConfirmationVC = Utility.fetchViewControllerWithName(vcName: "ConfirmationVC", storyBoardName: Constants.mainStoryBoard ) as! ConfirmationVC
        self.navigationController!.pushViewController(signUpVC, animated: true)
    }
}




//
//  LoginVC.swift
//  Wagespoon
//
//  Created by Ravi on 18/06/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class LoginVC: BaseVC ,ServicesDataHandlerProtocol {
    
    //All Xib Objects
    @IBOutlet weak var lblUnsuccessfullLogin: UILabel!
    @IBOutlet weak var btnEmployeer: UIButton!
    @IBOutlet weak var btnEmployee: UIButton!
    @IBOutlet weak var imgViewEmployer: UIImageView!
    @IBOutlet weak var imgViewEmployee: UIImageView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    var userSignInDataManger : UserSignInDataManager = UserSignInDataManager()
    
        
    // MARK: - UIView Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //Method call to initialize view
        intializeView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - initializeView Methods
    func intializeView(){
        
        //Change Status Bar color
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        //Set navigationbar to Clear-Color
        self.setNavigationBar(typeNavigation: .ClearNavigationType)
        
        //Set UItextfield Properties
        txtPassword.attributedPlaceholder = NSAttributedString(string: "Password",
                                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
        txtUsername.attributedPlaceholder = NSAttributedString(string: "Email Address",
                                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
        txtUsername.leftViewMode = UITextFieldViewMode.always
        txtPassword.leftViewMode = UITextFieldViewMode.always
        txtUsername.setLeftIcon(UIImage(named: "username")!, padding: 20,size: 12)
        txtPassword.setLeftIcon(UIImage(named: "password")!, padding: 20,size: 12)
        
        //Method call to hide lable
        hideLableUnsuccessfullLogin()
        
        //By default employee is selected
        btnEmployee.setTitleColor(UIColor.lightGray, for: .normal)
        imgViewEmployee.image = UIImage(named: "empolyeehilightedicon")
        Constants.isEmployee = true
        
        let username = UserDefaults.standard.string(forKey: "username")
        let password = UserDefaults.standard.string(forKey: "password")
        if (username != nil && username != "") &&
            (password != nil && password != ""){
            txtUsername.text = username
            txtPassword.text = password
            // actionToSignIn("" as AnyObject)
        }
        
        userSignInDataManger.delegate = self
        
    }
    
    // MARK: - UI-Methods
    func showHideLableUnsuccessfullLogin(stauts:Bool){
        if !stauts{
            lblUnsuccessfullLogin.isHidden = true
            
        }else{
            lblUnsuccessfullLogin.isHidden = false
        }
    }
    
    func hideLableUnsuccessfullLogin(){
        lblUnsuccessfullLogin.isHidden = true
    }
    
    // MARK: - UIButon Actions
    @IBAction func actionToSignIn(_ sender: Any) {
        
        let username = txtUsername.text
        let password = txtPassword.text
        
        if username == "" {
            Common.showHUD("Please input email", 1.0)
            return
        }
        
        if password == "" {
            Common.showHUD("Please input password", 1.0)
            return
        }
        
        UserDefaults.standard.setValue(username, forKey: "username")
        UserDefaults.standard.setValue(password, forKey: "password")
        
        self.startHud()
        login()
    }
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    func login() -> Void {
        getUserSignIn()
    }
    
    func getUserSignIn()  {
        var dict: [String: Any] = [:]
        if(Constants.isEmployee == true){
            dict["email"] = "queen"
            dict["password"] = "1"
            dict["user_type"] = "0"
        }
        else{
            dict["email"] = "king"
            dict["password"] = "1"
            dict["user_type"] = "1"
        }
        
        userSignInDataManger.getEntity(dict)
    }
    
    func didGetEntity(_ entity: Any) {
        
        if entity is WageSpoonBO{
            
            let userBO = entity as! WageSpoonBO
            if(userBO.errorcode == 1){
                Common.showHUD(userBO.errormsg!, 1.0)
            }
            else
            {
                EmployeeSessionManager.sharedInstance.cacheUserProfileLocaliy(param: userBO)
                employeeLoginSuccess()
            }
            self.stopHud()
        }
        else if entity is EmployerBOWageSpoon
        {
            let userBO = entity as! EmployerBOWageSpoon
            if(userBO.errorcode == 1){
                Common.showHUD(userBO.errormsg!, 1.0)
            }
            else
            {
                EmployerSessionManager.sharedInstance.cacheUserProfileLocaliy(param: userBO)
                employerLoginSuccess()
            }
            self.stopHud()
        }
    }
    //MARK : Data Handler Delegates
    
    func didGetEnity(_ enity: Any, withError error: ServicesError) -> Bool {
        self.stopHud()
        return false
    }
    
    func employeeLoginSuccess()
    {
        Constants.isEmployee = true
        Constants.appDelegate.showEmployeeStoryboard()
    }
    
    func employerLoginSuccess()
    {
        Constants.isEmployer = true
        Constants.appDelegate.showEmployerStoryboard()
    }
}


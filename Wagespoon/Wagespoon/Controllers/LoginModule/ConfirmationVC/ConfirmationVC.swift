//
//  ConfirmationVC.swift
//  Wagespoon
//
//  Created by Ravi Kant Chadda on 05/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import Alamofire

class ConfirmationVC: UIViewController {
    @IBOutlet weak var lblUserEmailAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeViews()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func actionToResendEmail(_ sender: Any) {
        
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
    func initializeViews(){
        let email = UserDefaults.standard.string(forKey: "email")
        lblUserEmailAddress.text = email
    }

    func register() -> Void {
        let email = UserDefaults.standard.string(forKey: "email")
        let password = UserDefaults.standard.string(forKey: "password")
        let userType = UserDefaults.standard.bool(forKey: "UserType") as Bool
        let parameters: Parameters = ["email":email!,
                                      "password": password!,
                                      "user_type": (userType ? Constants.UserType.EMPLOYEE : Constants.UserType.EMPLOYER)
        ]
        
        Alamofire.request(Constants.HTTP.HOST+Constants.HTTP.RegisterUrl, method: .post, parameters: parameters).responseJSON { (response:DataResponse) in
            
            if let _ = Common.dealResult(response) {
                Common.showHUD("Email Sent!", 1.5)
               
            }
        }
    }

}

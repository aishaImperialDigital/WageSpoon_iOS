//
//  LandingVC.swift
//  Wagespoon
//
//  Created by Ravi on 18/06/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class LandingVC: BaseVC {


    // MARK: - UIView Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - initializeView Methods
    func initializeView(){

        self.setNavigationBar(typeNavigation: .ClearNavigationType)

    }

    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "loginvcAsEmployee"{

            if let controller = segue.destination as? LoginVC{

                print(controller)
            }

          //  print("loginvcAsEmployee")

        }else if segue.identifier == "loginvcAsEmployer"{

            if let controller = segue.destination as? LoginVC{

                print(controller)
            }
          //  print("loginvcAsEmployer")


        }
    }


}

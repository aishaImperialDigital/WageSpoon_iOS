//
//  ApplicantInfoVC.swift
//  Wagespoon
//
//  Created by Ravi on 02/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class ApplicantInfoVC: WSParent, UITableViewDataSource, UITableViewDelegate, OverlayHost {
    
    @IBOutlet var myTableView: UITableView!
    //  var myTableView: UITableView  =   UITableView()
    var itemsToLoad: [String] = ["About me"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        intializeView()
    }
    
    // MARK: - initializeView Methods
    func intializeView(){
        if (Constants.isEmployee){
             self.headerView.titleLabel.text = "Job List"
        }
        else{
             self.headerView.titleLabel.text = "Applicant List"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemsToLoad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        if(Constants.isEmployer)
        {
            var cell: CommonApplicantCell?
            cell = tableView.dequeueReusableCell(withIdentifier: "CommonApplicantCell") as? CommonApplicantCell
            if cell == nil {
                cell = (CommonApplicantCell(style: .default, reuseIdentifier: "CommonApplicantCell"))
            }
            cell?.backgroundColor = UIColor.clear
            cell?.contentView.backgroundColor = UIColor.clear
            //cell?.titleLabel?.text = itemsToLoad[indexPath.row]
            cell?.appointButton.addTarget(self,action:#selector(openMessageBoxVC),
                                       for:.touchUpInside)
            cell?.waitlistButton.addTarget(self,action:#selector(openMessageBoxVC),
                                          for:.touchUpInside)
            cell?.interviewButton.addTarget(self,action:#selector(openMessageBoxVC),
                                          for:.touchUpInside)
            cell?.declineButton.addTarget(self,action:#selector(openMessageBoxVC),
                                          for:.touchUpInside)
            return cell!
        }
        else
        {
            var cell: CommonJobCell?
            cell = tableView.dequeueReusableCell(withIdentifier: "CommonJobCell") as? CommonJobCell
            if cell == nil {
                cell = (CommonJobCell(style: .default, reuseIdentifier: "CommonJobCell"))
            }
            cell?.backgroundColor = UIColor.clear
            cell?.contentView.backgroundColor = UIColor.clear
            //cell?.titleLabel?.text = itemsToLoad[indexPath.row]
            cell?.appointButton.addTarget(self,action:#selector(openMessageBoxVC),
                                          for:.touchUpInside)
            cell?.waitlistButton.addTarget(self,action:#selector(openMessageBoxVC),
                                           for:.touchUpInside)
            cell?.interviewButton.addTarget(self,action:#selector(openMessageBoxVC),
                                            for:.touchUpInside)
            cell?.declineButton.addTarget(self,action:#selector(openMessageBoxVC),
                                          for:.touchUpInside)

            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])")
        if(Constants.isEmployer){
            openPreviewVC()
        }
        else if Constants.isEmployee{
            openJobDetailVC()
        }
       
    }

    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 139.0
    }
    
    func openPreviewVC() {
        // isProfilePreviewMode = true
        // myTableView.reloadData()
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.employeeStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "MyProfileVC")
        // let Vc = navigationVc.navigationController?.presentedViewController as! MyProfileVC
        
        // let firstVC = navigationController?.viewControllers[0] as! MyProfileVC
        let profile = navigationVc as! MyProfileVC
        profile.setPreviewMode();
        self.navigationController?.pushViewController(profile, animated: true)
        
    }
    
    
    func openJobDetailVC() {
        // isProfilePreviewMode = true
        // myTableView.reloadData()
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.employerStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "JobDetailVC")
        // let Vc = navigationVc.navigationController?.presentedViewController as! MyProfileVC
        
        // let firstVC = navigationController?.viewControllers[0] as! MyProfileVC
        let profile = navigationVc as! JobDetailVC
        //profile.setPreviewMode();
        self.navigationController?.pushViewController(profile, animated: true)
        
    }
    
    func openMessageBoxVC() {
        //showOverlay(type: MessageViewController.self, fromStoryboardWithName: "Employer")
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.messagesStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "MessagesInboxVC")
        let nav =  self.navigationController
        nav?.pushViewController(navigationVc, animated:true)
        
        
    }
}

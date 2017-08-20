//
//  SettingsVC.swift
//  Wagespoon
//
//  Created by Ravi on 02/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//


import UIKit

class SettingsVC: WSParent, UITableViewDataSource, UITableViewDelegate {

@IBOutlet var myTableView: UITableView!
//  var myTableView: UITableView  =   UITableView()
var itemsToLoad: [String] = ["Notifications", "Change Password", "Terms & Conditions"]


override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    intializeView()
}

// MARK: - initializeView Methods
func intializeView(){
    self.headerView.titleLabel.text = "Settings"
    myTableView.dataSource = self
    myTableView.delegate = self
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
}

/*  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
 
 //Say 1 section with two different look
 var myProfileHeader: MyProfileHeader!
 myProfileHeader = MyProfileHeader.instanceFromNib() as! MyProfileHeader
 myTableView.tableHeaderView = myProfileHeader;
 if section == 0{
 
 return myProfileHeader;
 }
 else{
 return nil
 }
 }
 
 func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
 return 350
 }*/

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
{
    return itemsToLoad.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
{
    var cell: SettingsVCCell?
    cell = tableView.dequeueReusableCell(withIdentifier: "SettingsVCCell") as? SettingsVCCell
    if cell == nil {
        cell = (SettingsVCCell(style: .default, reuseIdentifier: "SettingsVCCell"))
    }
    cell?.backgroundColor = UIColor.clear
    cell?.contentView.backgroundColor = UIColor.clear
    cell?.titleLabel?.text = itemsToLoad[indexPath.row]
    return cell!
    
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
{
    print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])")
    if indexPath.row == 0
    {
        
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.settingsStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "NotificationsSettingsVC")
        let nav =  self.navigationController
        nav?.pushViewController(navigationVc, animated:true)
    }
    else if indexPath.row == 1
    {
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.settingsStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "ChangePasswordVC")
        let nav =  self.navigationController
        nav?.pushViewController(navigationVc, animated:true)
    }
}
func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}
    
    

}


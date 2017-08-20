//
//  SideMenuVC.swift
//  Wagespoon
//
//  Created by Ravi on 02/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import MFSideMenu


class SideMenuVC: UITableViewController {
    var wageSpoonBO: WageSpoonBO?
    var employerWageSpoonBO: EmployerBOWageSpoon?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableView Datasource/Delegate Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SideMenuCell = (tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as? SideMenuCell)!
        // Configure the cell...
        switch indexPath.row {
        case 0:
            cell.imageWidth.constant = (UIImage(named: "matchlist")?.size)!.width
            cell.imageHeight.constant = (UIImage(named: "matchlist")?.size)!.height
            cell.imgView?.image = UIImage(named: "matchlist")
            cell.lblTitle.text = "Match List"
        case 1:
            cell.imageWidth.constant = (UIImage(named: "messages")?.size)!.width
            cell.imageHeight.constant = (UIImage(named: "messages")?.size)!.height
            cell.imgView?.image = UIImage(named: "messages")
            cell.lblTitle.text = "Messages"
        case 2:
            cell.imageWidth.constant = (UIImage(named: "jobhistory")?.size)!.width
            cell.imageHeight.constant = (UIImage(named: "jobhistory")?.size)!.height
            cell.imgView?.image = UIImage(named: "jobhistory")
            cell.lblTitle.text = "Jobs History"
        case 3:
            cell.imageWidth.constant = (UIImage(named: "payment")?.size)!.width
            cell.imageHeight.constant = (UIImage(named: "payment")?.size)!.height
            cell.imgView?.image = UIImage(named: "payment")
            cell.lblTitle.text = "Payment"
        case 4:
            cell.imageWidth.constant = (UIImage(named: "notificationsicon")?.size)!.width
            cell.imageHeight.constant = (UIImage(named: "notificationsicon")?.size)!.height
            cell.imgView?.image = UIImage(named: "notificationsicon")
            cell.lblTitle.text = "Notifications"
        case 5:
            cell.imageWidth.constant = (UIImage(named: "logout")?.size)!.width
            cell.imageHeight.constant = (UIImage(named: "logout")?.size)!.height
            cell.imgView?.image = UIImage(named: "logout")
            cell.lblTitle.text = "Logout"

        default:
            break
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if let sideMenuHeaderView:SideMenuHeaderView = UIView.viewFromNibName(name: "SideMenuHeaderView") as? SideMenuHeaderView {

            if(Constants.isEmployee == true)
            {
                wageSpoonBO = EmployeeSessionManager.sharedInstance.getCacheUserProfile()
                let strName = wageSpoonBO?.data?.eeInfo?.name
                let strJob =  wageSpoonBO?.data?.eeInfo?.title
                sideMenuHeaderView.lblTitle.text = strName
                sideMenuHeaderView.lblSubTitle.text = strJob
                sideMenuHeaderView.imgViewUser.setImageWithUrl(URL(string:(wageSpoonBO?.data?.eeInfo?.profilePic)!)!, placeHolderImage: UIImage(named:"default_pic.png"))
            }
            else if( Constants.isEmployer == true)
            {
                employerWageSpoonBO = EmployerSessionManager.sharedInstance.getCacheUserProfile()
                let strName = employerWageSpoonBO?.data?.erInfo?.name
                let strJob = employerWageSpoonBO?.data?.erInfo?.descriptionField
                sideMenuHeaderView.lblTitle.text = strName
                sideMenuHeaderView.lblSubTitle.text = strJob
                sideMenuHeaderView.imgViewUser.setImageWithUrl(URL(string:(employerWageSpoonBO?.data?.erInfo?.profilePic)!)!, placeHolderImage: UIImage(named:"default_pic.png"))
            }
            
            return sideMenuHeaderView
        }else{
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 134
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
               self.callMatchJobListView()
            break
        case 1:
               self.callMessagesView()
            break
        case 2:
              self.callJobHistoryView()
            break
        case 3:
              self.callPaymentView()
            break
        case 4:
              self.callNotificationView()
            break
        case 5:
            Constants.isEmployee = false
            Constants.isEmployer = false
            Constants.appDelegate.callLoginModuleStoryBoard()
            break
        default:
            break
        }

        self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion:nil)


    }
    
    func callPaymentView(){
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.employeeStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "PaymentVC")
        Constants.appDelegate.appTabBar?.selectedViewController = Constants.appDelegate.appTabBar?.viewControllers?[0]
        let nav =  Constants.appDelegate.appTabBar?.selectedViewController as! UINavigationController!
        nav?.pushViewController(navigationVc, animated:true)
        
    }
    
    func callMatchJobListView(){
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.employeeStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "ApplicantInfoVC")
        Constants.appDelegate.appTabBar?.selectedViewController = Constants.appDelegate.appTabBar?.viewControllers?[0]
        
    }

    func callNotificationView(){
        
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.employeeStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "NotificationsVC")
        Constants.appDelegate.appTabBar?.selectedViewController = Constants.appDelegate.appTabBar?.viewControllers?[1]
    }
    
    func callMessagesView(){
        
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.messagesStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "MessagesVC")
        Constants.appDelegate.appTabBar?.selectedViewController = Constants.appDelegate.appTabBar?.viewControllers?[0]
        let nav =  Constants.appDelegate.appTabBar?.selectedViewController as! UINavigationController!
        nav?.pushViewController(navigationVc, animated:true)
        
    }
    
    func callJobHistoryView(){
        
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.employeeStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "JobHistoryVC")
        Constants.appDelegate.appTabBar?.selectedViewController = Constants.appDelegate.appTabBar?.viewControllers?[0]
        let nav =  Constants.appDelegate.appTabBar?.selectedViewController as! UINavigationController!
        nav?.pushViewController(navigationVc, animated:true)
        
    }


    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

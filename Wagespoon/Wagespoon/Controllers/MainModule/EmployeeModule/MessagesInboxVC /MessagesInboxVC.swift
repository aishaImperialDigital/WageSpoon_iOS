//
//  CommentsVC.swift
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit

class MessagesInboxVC: WSParent, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var myTableView: UITableView!
    //  var myTableView: UITableView  =   UITableView()
    var itemsToLoad: [String] = ["Great!!", "Awesome Project you have done.", "Great job"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        intializeView()
    }
    
    // MARK: - initializeView Methods
    func intializeView(){
        self.headerView.titleLabel.text = "Imperial Digital"
        myTableView.dataSource = self
        myTableView.delegate = self
        var myProfileHeader: MyProfileHeader!
        myProfileHeader = MyProfileHeader.instanceFromNib() as! MyProfileHeader
       // myTableView.tableHeaderView = myProfileHeader;
        myProfileHeader.leaveComments.isHidden = true
        myProfileHeader.seeComments.isHidden = true
        myProfileHeader.previewButton.isHidden = true
        myProfileHeader.editProfileButton.isHidden = true
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
        var cell: MessagesInboxCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "MessagesInboxCell") as? MessagesInboxCell
        if cell == nil {
            cell = (MessagesInboxCell(style: .default, reuseIdentifier: "MessagesInboxCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])")
    }
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
}

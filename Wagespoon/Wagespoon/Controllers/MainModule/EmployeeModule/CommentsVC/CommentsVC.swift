
//
//  CommentsVC.swift
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit

class CommentsVC: WSParent, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var myTableView: UITableView!
     var myProfileHeader: MyProfileHeader!
    //  var myTableView: UITableView  =   UITableView()
    var itemsToLoad: [String] = ["Great!!", "Awesome Project you have done.", "Great job"]
    var wageSpoonBO: WageSpoonBO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        intializeView()
    }
    
    // MARK: - initializeView Methods
    func intializeView(){
        self.headerView.titleLabel.text = "Comments"
        myTableView.dataSource = self
        myTableView.delegate = self
       
        myProfileHeader = MyProfileHeader.instanceFromNib() as! MyProfileHeader
        myTableView.tableHeaderView = myProfileHeader;
        myProfileHeader.leaveComments.isHidden = true
        myProfileHeader.seeComments.isHidden = true
        myProfileHeader.previewButton.isHidden = true
        myProfileHeader.editProfileButton.isHidden = true
        self.isHeaderViewRequired = false
        self.addBackHeader()
        self.backHeaderView.titleLabel.text = "Comments"
        myProfileHeader.leaveComments.isHidden = true
        myProfileHeader.seeComments.isHidden = true
        myProfileHeader.aceptButton.isHidden = true
        myProfileHeader.rejectButton.isHidden = true
        
        wageSpoonBO = EmployeeSessionManager.sharedInstance.getCacheUserProfile()
        setProfileData()
      
    }
    
    func setProfileData() {
        myProfileHeader.completionLabel.text = "" + ((wageSpoonBO?.data?.eeInfo?.verifyChk)!) + "%"
        myProfileHeader.nameTitleLabel.text = wageSpoonBO?.data?.eeInfo?.name
        myProfileHeader.detailsLabel.text = wageSpoonBO?.data?.eeInfo?.title
        myProfileHeader.imageView.setImageWithUrl(URL(string:(wageSpoonBO?.data?.eeInfo?.profilePic)!)!, placeHolderImage: UIImage(named: "default_pic"))
      //  myProfileHeader.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        myProfileHeader.imageView.isUserInteractionEnabled = true //also can be set via storyboard
        myProfileHeader.userLikesLabel.text = wageSpoonBO?.data?.eeInfo?.userLikes
        myProfileHeader.userDisLikesLabel.text = wageSpoonBO?.data?.eeInfo?.userDislikes
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemsToLoad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell: CommentsCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "CommentsCell") as? CommentsCell
        if cell == nil {
            cell = (CommentsCell(style: .default, reuseIdentifier: "CommentsCell"))
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
        return 94.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let myProfileFooter = LeaveComments.instanceFromNib() as! LeaveComments
        myTableView.tableFooterView = myProfileFooter;
        return myProfileFooter;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    

}


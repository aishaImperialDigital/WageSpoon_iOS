//
//  SettingsVC.swift
//  Wagespoon
//
//  Created by Ravi on 02/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class NotificationsSettingsVC: WSParent, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet var myTableView: UITableView!
  //  var myTableView: UITableView  =   UITableView()
    var itemsToLoad: [String] = ["30 Days", "15 Days", "5 Days"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        intializeView()
    }
    
    // MARK: - initializeView Methods
    func intializeView(){
        self.headerView.titleLabel.text = "Notifications"
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
        var cell: NotificationsSettingsViewCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsSettingsViewCell") as? NotificationsSettingsViewCell
        if cell == nil {
            cell = (NotificationsSettingsViewCell(style: .default, reuseIdentifier: "NotificationsSettingsViewCell"))
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
    
}


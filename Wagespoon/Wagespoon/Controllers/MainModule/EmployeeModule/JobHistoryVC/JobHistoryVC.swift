//
//  CommentsVC.swift
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit

class JobHistoryVC: WSParent, UITableViewDataSource, UITableViewDelegate ,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var selectMonthButton: UIButton!
    var datePicker: VoomListPickerView!
    //  var myTableView: UITableView  =   UITableView()
    var itemsToLoad: [String] = ["Joshua has accepted your offer for graphic designer post", "Bummer! Your application was not successful", "Congrats You have recieved an invitation"]
     var itemsToLoadONPICKER: [String] = ["Jan","Feb","March","April","May","June", "July","August","September","October","November","December"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        intializeView()
    }
    
    // MARK: - initializeView Methods
    func intializeView(){
        self.headerView.titleLabel.text = "Jobs History"
        myTableView.dataSource = self
        myTableView.delegate = self
       /*var myProfileHeader: MyProfileHeader!
        myProfileHeader = MyProfileHeader.instanceFromNib() as! MyProfileHeader
        myTableView.tableHeaderView = myProfileHeader;
        myProfileHeader.leaveComments.isHidden = true
        myProfileHeader.seeComments.isHidden = true
        myProfileHeader.previewButton.isHidden = true
        myProfileHeader.editProfileButton.isHidden = true*/
        selectMonthButton.addTarget(self, action: #selector(selectMonthAction), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectMonthAction(){
        addDatePicker(textField:selectMonthButton)
    }
    
    func addDatePicker(textField: UIButton) {
        datePicker = Bundle.main.loadNibNamed("VoomListPickerView", owner: self, options: nil)?[0] as! VoomListPickerView
        datePicker.frame = CGRect(x: 0, y: Constants.ScreenSize.SCREEN_HEIGHT - datePicker.frame.size.height, width: datePicker.frame.size.width, height: datePicker.frame.size.height)
        let mainWindow: UIWindow? = UIApplication.shared.keyWindow
        mainWindow?.addSubview(datePicker)
        //  [self.view addSubview:self.datePicker];
        datePicker.isHidden = false
       // datePicker.datePicker.timeZone = NSTimeZone.local
       //  datePicker.dateTextfield = textField
       //  datePicker.dateTextfield = textField
       // datePicker.dateTextfield.delegate = datePicker
        datePicker.datePicker.delegate = self
        datePicker.datePicker.dataSource = self
    }
    
    
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsToLoadONPICKER.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return itemsToLoadONPICKER[row]
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
        var cell: JobHistoryCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "JobHistoryCell") as? JobHistoryCell
        if cell == nil {
            cell = (JobHistoryCell(style: .default, reuseIdentifier: "JobHistoryCell"))
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
        return 94
    }
    
}

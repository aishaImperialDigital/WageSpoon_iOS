//
//  CommonCell
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit
class ExperienceCell: MyProfileParentCell{
   
  
    @IBOutlet var holderView: UIView!
    @IBOutlet var experienceFromTextFeild: UITextField!
    @IBOutlet var experienceToTextFeild: UITextField!
    @IBOutlet var companyNameTextFeild: UITextField!
    @IBOutlet var titleNameTextFeild: UITextField!
    @IBOutlet var isCurrentButton: UIButton!
    var experiencesModel: [WageSpoonExpList]?
    var datePicker: VoomDatePickerView!
    // add time and date pickers
   
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        Bundle.main.loadNibNamed("ExperienceCell", owner: self, options: nil)
        holderView.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        contentView.addSubview(holderView)
        experiencesModel = [WageSpoonExpList.init(data:"")]
       
        self.addDatePicker(textField: self.experienceFromTextFeild);
        self.addDatePicker(textField: self.experienceToTextFeild);
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

    func setProfileData(){
        companyNameTextFeild.text = experiencesModel?[0].expCompany
        titleNameTextFeild.text = experiencesModel?[0].expTitle
        experienceToTextFeild.text = experiencesModel![0].experienceTo
        experienceFromTextFeild.text = experiencesModel![0].experienceFrom
    }
    
    func addDatePicker(textField: UITextField) {
        datePicker = Bundle.main.loadNibNamed("VoomDatePickerView", owner: self, options: nil)?[0] as! VoomDatePickerView
        datePicker.frame = CGRect(x: 0, y: Constants.ScreenSize.SCREEN_HEIGHT - datePicker.frame.size.height, width: datePicker.frame.size.width, height: datePicker.frame.size.height)
        let mainWindow: UIWindow? = UIApplication.shared.keyWindow
        mainWindow?.addSubview(datePicker)
        //  [self.view addSubview:self.datePicker];
        datePicker.isHidden = true
        datePicker.datePicker.timeZone = NSTimeZone.local
        datePicker.dateTextfield = textField
        datePicker.dateTextfield = textField
        datePicker.dateTextfield.delegate = datePicker
    }

}

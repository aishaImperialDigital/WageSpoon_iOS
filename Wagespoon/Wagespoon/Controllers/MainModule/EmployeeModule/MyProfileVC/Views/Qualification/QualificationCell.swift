//
//  CommonCell
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit
class QualificationCell: MyProfileParentCell{
   

    @IBOutlet var holderView: UIView!
    @IBOutlet var qualificationTextField: UITextField!
    @IBOutlet var qualificationFromTextField: UITextField!
    @IBOutlet var qualificationToTextField: UITextField!
 
    var datePicker: VoomDatePickerView!
    var qualificationsModel: [WageSpoonQualifiList]?
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        Bundle.main.loadNibNamed("QualificationCell", owner: self, options: nil)
        holderView.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        contentView.addSubview(holderView)
        self.initializeView()
        qualificationsModel = [WageSpoonQualifiList.init(data:"")]
       
    }
    
    func initializeView(){
        
        self.doneButton.addTarget(self,action:#selector(buttonClicked),
                                  for:.touchUpInside)
  
        // add time and date pickers
        self.addDatePicker(textField: self.qualificationFromTextField);
        self.addDatePicker(textField: self.qualificationToTextField);
        
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

    

    func buttonClicked(sender:UIButton)
    {
        self.setModel()
    }
    
    func setModel(){
      
    }
    
    func setProfileData(){
        qualificationTextField.text = qualificationsModel?[0].qualificationName
        qualificationFromTextField.text = qualificationsModel![0].qualificationFrom
        qualificationToTextField.text = qualificationsModel![0].qualificationTo
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

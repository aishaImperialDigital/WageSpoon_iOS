//
//  CommonCell
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit
class TimeAvlbCell: MyProfileParentCell{
   
 
    @IBOutlet var holderView: UIView!
    @IBOutlet var timeAvailableFrom: UITextField!
    @IBOutlet var timeAvailableTo: UITextField!

    @IBOutlet var startRandomTime: UITextField!
    @IBOutlet var endRandomTime: UITextField!
    
    @IBOutlet var mondayButton: UIButton!
    @IBOutlet var tuesdayButton: UIButton!
    @IBOutlet var weddayButton: UIButton!
    @IBOutlet var thurdayButton: UIButton!
    @IBOutlet var fridayButton: UIButton!
    @IBOutlet var satdayButton: UIButton!
    @IBOutlet var sundayButton: UIButton!
    var timeAvailabilityModel: AvailableTime!
    var datePicker: VoomDatePickerView!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        Bundle.main.loadNibNamed("TimeAvlbCell", owner: self, options: nil)
        holderView.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        contentView.addSubview(holderView)
        self.initializeView()
    }
    
    func initializeView(){
        
        self.doneButton.addTarget(self,action:#selector(buttonClicked),
                                  for:.touchUpInside)
        // add time and date pickers
        self.addDatePicker(textField: self.timeAvailableFrom);
        self.addDatePicker(textField: self.timeAvailableTo);
        self.addDatePicker(textField: self.startRandomTime);
        self.addDatePicker(textField: self.endRandomTime);
        
        //
        
        mondayButton.layer.cornerRadius = 0.5 * mondayButton.bounds.size.width
        mondayButton.layer.borderColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1).cgColor as CGColor
        mondayButton.layer.borderWidth = 2.0
        mondayButton.clipsToBounds = true
        
        tuesdayButton.layer.cornerRadius = 0.5 * tuesdayButton.bounds.size.width
        tuesdayButton.layer.borderColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1).cgColor as CGColor
        tuesdayButton.layer.borderWidth = 2.0
        tuesdayButton.clipsToBounds = true
        
        weddayButton.layer.cornerRadius = 0.5 * weddayButton.bounds.size.width
        weddayButton.layer.borderColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1).cgColor as CGColor
        weddayButton.layer.borderWidth = 2.0
        weddayButton.clipsToBounds = true
        
        thurdayButton.layer.cornerRadius = 0.5 * thurdayButton.bounds.size.width
        thurdayButton.layer.borderColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1).cgColor as CGColor
        thurdayButton.layer.borderWidth = 2.0
        thurdayButton.clipsToBounds = true
        
        fridayButton.layer.cornerRadius = 0.5 * fridayButton.bounds.size.width
        fridayButton.layer.borderColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1).cgColor as CGColor
        fridayButton.layer.borderWidth = 2.0
        fridayButton.clipsToBounds = true
        
        satdayButton.layer.cornerRadius = 0.5 * satdayButton.bounds.size.width
        satdayButton.layer.borderColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1).cgColor as CGColor
        satdayButton.layer.borderWidth = 2.0
        satdayButton.clipsToBounds = true
        
        sundayButton.layer.cornerRadius = 0.5 * sundayButton.bounds.size.width
        sundayButton.layer.borderColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1).cgColor as CGColor
        sundayButton.layer.borderWidth = 2.0
        sundayButton.clipsToBounds = true
        
        
        //
        
        
        
        timeAvailabilityModel = AvailableTime.init()
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
    
    @IBAction func daySelectionAction(_ sender: Any) {
        let button: UIButton = sender as! UIButton
        if(button.isSelected){
           
            button.backgroundColor = UIColor.clear ;
            button.isSelected = false

          
        }
        else
        {
            button.backgroundColor = UIColor.black ;
            button.isSelected = true
            button.titleLabel?.textColor = UIColor.white
        }
      
    }
    
    func buttonClicked(sender:UIButton)
    {
        self.setModel()
    }
    
    
 
    func setModel(){
        
        timeAvailabilityModel?.fixed_date_from = timeAvailableFrom.text
        timeAvailabilityModel?.fixed_date_to = timeAvailableTo.text
        timeAvailabilityModel?.part_time_from = startRandomTime.text
        timeAvailabilityModel?.part_time_to = endRandomTime.text
        timeAvailabilityModel?.part_time_mon = mondayButton.isSelected
        timeAvailabilityModel?.part_time_tue = tuesdayButton.isSelected
        timeAvailabilityModel?.part_time_wed = weddayButton.isSelected
        timeAvailabilityModel?.part_time_thu = thurdayButton.isSelected
        timeAvailabilityModel?.part_time_fri = fridayButton.isSelected
        timeAvailabilityModel?.part_time_sat = satdayButton.isSelected
        timeAvailabilityModel?.part_time_sun = sundayButton.isSelected
    }
    
    func setProfileData(){
        
        timeAvailableFrom.text = timeAvailabilityModel?.fixed_date_from
        timeAvailableTo.text = timeAvailabilityModel?.fixed_date_to
        startRandomTime.text =  timeAvailabilityModel?.part_time_from
        endRandomTime.text =  timeAvailabilityModel?.part_time_to
        mondayButton.isSelected = (timeAvailabilityModel?.part_time_mon)!
        tuesdayButton.isSelected = (timeAvailabilityModel?.part_time_tue)!
        weddayButton.isSelected = (timeAvailabilityModel?.part_time_wed)!
        thurdayButton.isSelected = (timeAvailabilityModel?.part_time_thu)!
        fridayButton.isSelected = (timeAvailabilityModel?.part_time_fri)!
        satdayButton.isSelected = (timeAvailabilityModel?.part_time_sat)!
        sundayButton.isSelected = (timeAvailabilityModel?.part_time_sun)!
        setButtonStates()
    }
    
    func setButtonStates() {
        if(mondayButton.isSelected){
            mondayButton.backgroundColor = UIColor.clear ;
            mondayButton.isSelected = false
        }
        else
        {
            mondayButton.backgroundColor = UIColor.black ;
            mondayButton.isSelected = true
            mondayButton.titleLabel?.textColor = UIColor.white
        }
        if(tuesdayButton.isSelected){
            tuesdayButton.backgroundColor = UIColor.clear ;
            tuesdayButton.isSelected = false
        }
        else
        {
            tuesdayButton.backgroundColor = UIColor.black ;
            tuesdayButton.isSelected = true
            tuesdayButton.titleLabel?.textColor = UIColor.white
        }
        if(weddayButton.isSelected){
            weddayButton.backgroundColor = UIColor.clear ;
            weddayButton.isSelected = false
        }
        else
        {
            weddayButton.backgroundColor = UIColor.black ;
            weddayButton.isSelected = true
            weddayButton.titleLabel?.textColor = UIColor.white
        }
        if(thurdayButton.isSelected){
            thurdayButton.backgroundColor = UIColor.clear ;
            thurdayButton.isSelected = false
        }
        else
        {
            thurdayButton.backgroundColor = UIColor.black ;
            thurdayButton.isSelected = true
            thurdayButton.titleLabel?.textColor = UIColor.white
        }
        if(fridayButton.isSelected){
            fridayButton.backgroundColor = UIColor.clear ;
            fridayButton.isSelected = false
        }
        else
        {
            fridayButton.backgroundColor = UIColor.black ;
            fridayButton.isSelected = true
            fridayButton.titleLabel?.textColor = UIColor.white
        }
        if(satdayButton.isSelected){
            satdayButton.backgroundColor = UIColor.clear ;
            satdayButton.isSelected = false
        }
        else
        {
            satdayButton.backgroundColor = UIColor.black ;
            satdayButton.isSelected = true
            satdayButton.titleLabel?.textColor = UIColor.white
        }
        
        if(sundayButton.isSelected){
            sundayButton.backgroundColor = UIColor.clear ;
            sundayButton.isSelected = false
        }
        else
        {
            sundayButton.backgroundColor = UIColor.black ;
            sundayButton.isSelected = true
            sundayButton.titleLabel?.textColor = UIColor.white
        }
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

//
//  MyProfileVC.swift
//  Wagespoon
//
//  Created by Ravi on 02/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import Alamofire

struct ProfileFieldsHeights{
    static let Common = 48
    static let AboutMe = 240
    static let TimeAvailability =  360
    static let Proximity =  140
    static let Skills = 240
    static let Experience = 480
    static let Qualification = 720
    static let PreferedLocation = 240
    static let Appearance = 240
    static let CertificatonsDocuments = 240
    static let Accreditation = 240
}

extension String {
    var boolValue: Bool {
        return NSString(string: self).boolValue
    }}

extension String {
    var floatValue: Float {
        return NSString(string: self).floatValue
    }}




class MyProfileVC: WSParent,UITableViewDataSource,UITableViewDelegate,OverlayHost,UITextFieldDelegate,UIPickerViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
    @IBOutlet var myTableView: UITableView!
    //  var myTableView: UITableView  =   UITableView()
    var itemsToLoad: [String] = ["About me", "Time Availability", "Proximity", "Skills", "Experience", "Qualification", "Prefered Location","Appearance", "Certificatons & Documents", "Accreditation"]
    var isProfileEditing:Bool = false
    var selectedEditField: Int = -1
    var isAboutMeFieldOpen: Bool = false
    var isTimeVavailableFieldOpen: Bool = false
    var isProximityFieldOpen: Bool = false
    var isSkillsFieldOpen: Bool = false
    var isExperienceFieldOpen: Bool = false
    var isQualificationFieldOpen: Bool = false
    var isPrefferedLocationFieldOpen: Bool = false
    var isAppearanceFieldOpen: Bool = false
    var isCertificationFieldOpen: Bool = false
    var isAccredationFieldOpen: Bool = false
    
    var isAcceptedForJob: Bool = false
    
   // public var isProfilePreviewMode: Bool = false
    
    private(set) public var isProfilePreviewMode: Bool = false
    var myProfileHeader: MyProfileHeader!
    var myProfileHeaderEditable: MyProfileHeaderEditable!
    //var imageButton = UIButton()
    
    weak var imageButton: UIButton!
    var imageView : UIImageView!
    //models
    var timeAvailabilityModel: AvailableTime = AvailableTime.init()
    var proximityModel: Proximity = Proximity.init()
    var skillsModel: [WageSpoonSkillsList] = [WageSpoonSkillsList.init(data:"")]
    var qualificationsModel: [WageSpoonQualifiList] = [WageSpoonQualifiList.init(data:"")]
    var experiencesModel: [WageSpoonExpList] = [WageSpoonExpList.init(data:"")]
    var locationsModel: [WageSpoonLocList] = [WageSpoonLocList.init(data:"")]
    var certificationsModel: [WageSpoonCertifiList] = [WageSpoonCertifiList.init(data:"")]
    var appearancesModel: [WageSpoonApearList] = [WageSpoonApearList.init(data:"")]
    var wageSpoonBO: WageSpoonBO?
    let imagePicker = UIImagePickerController()
   
    func setPreviewMode() {
        isProfilePreviewMode = true
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        intializeView()
        getProfile()
        //showOverlay(type: MessageViewController.self, fromStoryboardWithName: "Employee")
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().isEnableAutoToolbar = false
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        
        print(isProfilePreviewMode)
        wageSpoonBO = EmployeeSessionManager.sharedInstance.getCacheUserProfile()
        setProfileData()
        
    }
    func setProfileData() {
        myProfileHeader.completionLabel.text = "" + ((wageSpoonBO?.data?.eeInfo?.verifyChk)!) + "%"
        myProfileHeader.nameTitleLabel.text = wageSpoonBO?.data?.eeInfo?.name
        myProfileHeader.detailsLabel.text = wageSpoonBO?.data?.eeInfo?.title
        myProfileHeader.imageView.setImageWithUrl(URL(string:(wageSpoonBO?.data?.eeInfo?.profilePic)!)!, placeHolderImage: UIImage(named: "default_pic"))
        myProfileHeader.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        myProfileHeader.imageView.isUserInteractionEnabled = true //also can be set via storyboard
        myProfileHeader.userLikesLabel.text = wageSpoonBO?.data?.eeInfo?.userLikes
        myProfileHeader.userDisLikesLabel.text = wageSpoonBO?.data?.eeInfo?.userDislikes
        
        //time availability
        timeAvailabilityModel.time_availability_id = wageSpoonBO?.data?.eeInfo?.timeAvailabilityId
        timeAvailabilityModel.part_time_to = wageSpoonBO?.data?.eeInfo?.partTimeTo
        timeAvailabilityModel.part_time_from = wageSpoonBO?.data?.eeInfo?.partTimeFrom
        timeAvailabilityModel.part_time_fri = wageSpoonBO?.data?.eeInfo?.partTimeFri?.boolValue
        timeAvailabilityModel.part_time_mon = wageSpoonBO?.data?.eeInfo?.partTimeMon?.boolValue
        timeAvailabilityModel.part_time_tue = wageSpoonBO?.data?.eeInfo?.partTimeTue?.boolValue
        timeAvailabilityModel.part_time_wed = wageSpoonBO?.data?.eeInfo?.partTimeWed?.boolValue
        timeAvailabilityModel.part_time_thu = wageSpoonBO?.data?.eeInfo?.partTimeThu?.boolValue
        timeAvailabilityModel.part_time_sat = wageSpoonBO?.data?.eeInfo?.partTimeSat?.boolValue
        timeAvailabilityModel.part_time_sun = wageSpoonBO?.data?.eeInfo?.partTimeSun?.boolValue
        timeAvailabilityModel.fixed_date_from = wageSpoonBO?.data?.eeInfo?.fixedDateFrom
        timeAvailabilityModel.fixed_date_to = wageSpoonBO?.data?.eeInfo?.fixedDateTo
        
        // proximity
        proximityModel.proximity_from = wageSpoonBO?.data?.eeInfo?.proximityFrom
        proximityModel.proximity_id = wageSpoonBO?.data?.eeInfo?.proximityId
        proximityModel.proximity_to =  wageSpoonBO?.data?.eeInfo?.proximityTo
        
        skillsModel = (wageSpoonBO?.data?.skillsList)!
        qualificationsModel = (wageSpoonBO?.data?.qualifiList)!
        experiencesModel = (wageSpoonBO?.data?.expList)!
        locationsModel = (wageSpoonBO?.data?.locList)!
        certificationsModel = (wageSpoonBO?.data?.certifiList)!
        appearancesModel = (wageSpoonBO?.data?.apearList)!
        
        myTableView.reloadData()
    }
    
    
    // MARK: - initializeView Methods
    func intializeView(){
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myProfileHeader = MyProfileHeader.instanceFromNib() as! MyProfileHeader
        myProfileHeaderEditable = MyProfileHeaderEditable.instanceFromNib() as! MyProfileHeaderEditable
        
        myTableView.tableHeaderView = myProfileHeader;
        myProfileHeader.leaveComments.addTarget(self, action:#selector(openCommentsVC), for:.touchUpInside)
        myProfileHeader.seeComments.addTarget(self, action: #selector(openCommentsVC), for:.touchUpInside)
        myProfileHeader.previewButton.addTarget(self, action: #selector(openPreviewVC), for:.touchUpInside)
        myProfileHeader.editProfileButton.addTarget(self, action: #selector(openEditPreviewVC), for:.touchUpInside)
        myTableView.allowsSelection = false
        
        if(isProfilePreviewMode == true){
            
            myProfileHeader.previewButton.isHidden = true
            self.isHeaderViewRequired = false
            self.addBackHeader()
            self.backHeaderView.titleLabel.text = "Applicant Info"
            myProfileHeader.leaveComments.isHidden = false
            myProfileHeader.seeComments.isHidden = false
            myProfileHeader.editProfileButton.isHidden = true
        }
        else{
            self.headerView.titleLabel.text = "My Profile"
            myProfileHeader.aceptButton.isHidden = true
            myProfileHeader.rejectButton.isHidden = true
  
        }
        
        
        myProfileHeader.aceptButton.addTarget(self, action: #selector(acceptedForJob), for:.touchUpInside)
        myProfileHeader.rejectButton.addTarget(self, action: #selector(rejectedForJob), for:.touchUpInside)
        imagePicker.delegate = self
        
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
    
    func getAboutMeCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: AboutMeCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "AboutMeCell") as? AboutMeCell
        if cell == nil {
            cell = (AboutMeCell(style: .default, reuseIdentifier: "AboutMeCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.doneButton.tag = indexPath.row;
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        cell?.textView.text = wageSpoonBO?.data?.eeInfo?.descriptionField
        
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        
        return cell!
    }
    
    
    func getTimeAvlbCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: TimeAvlbCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "TimeAvlbCell") as? TimeAvlbCell
        if cell == nil {
            cell = (TimeAvlbCell(style: .default, reuseIdentifier: "TimeAvlbCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.doneButton.tag = indexPath.row;
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        cell?.timeAvailabilityModel.setAvailbleTime(availableTime: (self.timeAvailabilityModel))
        cell?.setProfileData()
        return cell!
    }
    
    
    func getProximityCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: ProximityCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "ProximityCell") as? ProximityCell
        if cell == nil {
            cell = (ProximityCell(style: .default, reuseIdentifier: "ProximityCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.doneButton.tag = indexPath.row;
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        cell?.proximityModel.setProximity(proximity: self.proximityModel)
        cell?.setProfileData()
        return cell!
    }
    
    func getSkillsCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: SkillsCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "SkillsCell") as? SkillsCell
        if cell == nil {
            cell = (SkillsCell(style: .default, reuseIdentifier: "SkillsCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.doneButton.tag = indexPath.row;
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        cell?.skillsModel = self.skillsModel
        cell?.setProfileData()
        return cell!
    }
    
    func getExperienceCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: ExperienceCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCell") as? ExperienceCell
        if cell == nil {
            cell = (ExperienceCell(style: .default, reuseIdentifier: "ExperienceCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.doneButton.tag = indexPath.row;
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        cell?.experiencesModel = self.experiencesModel
        cell?.setProfileData()
        return cell!
    }
    
    func getQualificationCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: QualificationCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "QualificationCell") as? QualificationCell
        if cell == nil {
            cell = (QualificationCell(style: .default, reuseIdentifier: "QualificationCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.doneButton.tag = indexPath.row;
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        cell?.qualificationsModel = self.qualificationsModel
        cell?.setProfileData()
        return cell!
    }
    
    func getPreferredLocationCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: PreferredLocationCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "PreferredLocationCell") as? PreferredLocationCell
        if cell == nil {
            cell = (PreferredLocationCell(style: .default, reuseIdentifier: "PreferredLocationCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.doneButton.tag = indexPath.row;
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        cell?.locationsModel = self.locationsModel
        cell?.setProfileData()
        return cell!
    }
    
    func getAppearanceCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: AppearanceCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "AppearanceCell") as? AppearanceCell
        if cell == nil {
            cell = (AppearanceCell(style: .default, reuseIdentifier: "AppearanceCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.doneButton.tag = indexPath.row;
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        // cell?.pickerImageButton.addTarget(self, action: #selector(loadImageButtonTapped(sender:)), for: .touchUpInside)
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:)))
        cell?.pickerImageView.addGestureRecognizer(pictureTap)
        cell?.pickerImageView.isUserInteractionEnabled = true //also can be set via storyboard
        cell?.pickerImageView.setImageWithUrl(URL(string:(self.appearancesModel[0].apearence_pic)!)!, placeHolderImage: UIImage(named:"add-image_3x.png"))
        cell?.appearencesModel = self.appearancesModel
        cell?.setProfileData()
        return cell!
    }
    
    
    func getCommunicationCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: CommunicationCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "CommunicationCell") as? CommunicationCell
        if cell == nil {
            cell = (CommunicationCell(style: .default, reuseIdentifier: "CommunicationCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.doneButton.tag = indexPath.row;
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        
        cell?.documentImage1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        
        cell?.documentImage2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        
        cell?.documentImage3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        
        cell?.documentImage4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        
        cell?.documentImage1.isUserInteractionEnabled = true //also can be set via storyboard
        
        cell?.documentImage2.isUserInteractionEnabled = true //also can be set via storyboard
        
        cell?.documentImage3.isUserInteractionEnabled = true //also can be set via storyboard
        
        cell?.documentImage4.isUserInteractionEnabled = true //also can be set via storyboard
        
        cell?.documentImage1.setImageWithUrl(URL(string:(self.certificationsModel[0].documentPic)!)!, placeHolderImage: UIImage(named:"add-image_3x.png"))
        
        cell?.documentImage2.setImageWithUrl(URL(string:(self.certificationsModel[0].documentPic)!)!, placeHolderImage: UIImage(named:"add-image_3x.png"))
        
        cell?.documentImage3.setImageWithUrl(URL(string:(self.certificationsModel[0].documentPic)!)!, placeHolderImage: UIImage(named:"add-image_3x.png"))
        
        cell?.documentImage4.setImageWithUrl(URL(string:(self.certificationsModel[0].documentPic)!)!, placeHolderImage: UIImage(named:"add-image_3x.png"))
        
        cell?.certificationsModel = self.certificationsModel
        cell?.setProfileData()
        return cell!
    }
    
    func getAccreditationCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: AccreditationCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "AccreditationCell") as? AccreditationCell
        if cell == nil {
            cell = (AccreditationCell(style: .default, reuseIdentifier: "AccreditationCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.doneButton.tag = indexPath.row;
        cell?.doneButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        return cell!
    }
    
    func getCommonCell(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    {
        var cell: CommonCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "CommonCell") as? CommonCell
        if cell == nil {
            cell = (CommonCell(style: .default, reuseIdentifier: "CommonCell"))
        }
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.titleLabel?.text = itemsToLoad[indexPath.row]
        cell?.editButton.tag = indexPath.row;
        cell?.editButton.addTarget(self,action:#selector(buttonClicked),
                                   for:.touchUpInside)
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(isProfilePreviewMode == false)
        {
            if(isAboutMeFieldOpen == true && indexPath.row == self.selectedEditField){
                
                return getAboutMeCell(tableView: tableView,indexPath: indexPath)
            }
            else if(isTimeVavailableFieldOpen == true && indexPath.row == self.selectedEditField){
                
                return getTimeAvlbCell(tableView: tableView,indexPath: indexPath)
            }
            else if(isProximityFieldOpen == true && indexPath.row == self.selectedEditField){
                
                return getProximityCell(tableView: tableView,indexPath: indexPath)
            }
            else if(isSkillsFieldOpen == true && indexPath.row == self.selectedEditField){
                
                return getSkillsCell(tableView: tableView,indexPath: indexPath)
                
            }
            else if(isExperienceFieldOpen == true && indexPath.row == self.selectedEditField){
                return getExperienceCell(tableView: tableView,indexPath: indexPath)
            }
                
            else if(isQualificationFieldOpen == true && indexPath.row == self.selectedEditField){
                return getQualificationCell(tableView: tableView, indexPath:indexPath)
            }
            else if(isPrefferedLocationFieldOpen == true && indexPath.row == self.selectedEditField){
                return getPreferredLocationCell(tableView: tableView, indexPath:indexPath)
                
            }
            else if(isAppearanceFieldOpen == true && indexPath.row == self.selectedEditField){
                return getAppearanceCell(tableView: tableView, indexPath:indexPath)
                
            }
            else if(isCertificationFieldOpen == true && indexPath.row == self.selectedEditField){
                return getCommunicationCell(tableView: tableView, indexPath:indexPath)
                
            }
            else if(isAccredationFieldOpen == true && indexPath.row == self.selectedEditField){
                return getAccreditationCell(tableView: tableView, indexPath:indexPath)
                
            }
            else
            {
                return getCommonCell(tableView: tableView, indexPath:indexPath)
                
            }
        }
        else
        {
            if(indexPath.row == Constants.ProfileFields.AboutMe){
                
                return getAboutMeCell(tableView: tableView,indexPath: indexPath)
            }
            else if(indexPath.row == Constants.ProfileFields.TimeAvailability){
                
                return getTimeAvlbCell(tableView: tableView,indexPath: indexPath)
            }
            else if(indexPath.row == Constants.ProfileFields.Proximity){
                return getProximityCell(tableView: tableView,indexPath: indexPath)
            }
            else if(indexPath.row == Constants.ProfileFields.Skills){
                return getSkillsCell(tableView: tableView,indexPath: indexPath)
            }
            else if(indexPath.row == Constants.ProfileFields.Experience){
                return getExperienceCell(tableView: tableView,indexPath: indexPath)
            }
                
            else if(indexPath.row == Constants.ProfileFields.Qualification){
                return getQualificationCell(tableView: tableView, indexPath:indexPath)
            }
            else if(indexPath.row == Constants.ProfileFields.PreferedLocation){
                return getPreferredLocationCell(tableView: tableView, indexPath:indexPath)
            }
            else if(indexPath.row == Constants.ProfileFields.Appearance){
                return getAppearanceCell(tableView: tableView, indexPath:indexPath)
                
            }
            else if(indexPath.row == Constants.ProfileFields.CertificatonsDocuments){
                return getCommunicationCell(tableView: tableView, indexPath:indexPath)
            }
                
            else if(indexPath.row == Constants.ProfileFields.Accreditation){
                return getAccreditationCell(tableView: tableView, indexPath:indexPath)
            }
            else
            {
                return getCommonCell(tableView: tableView, indexPath:indexPath)
            }
            
        }
    }
    
    
    func buttonClicked(sender:UIButton)
    {
        resetAll()
        switch sender.tag
        {
        case Constants.ProfileFields.AboutMe: print("0")     //when Button0 is clicked...
        self.editAboutMe();
            break
        case Constants.ProfileFields.TimeAvailability: print("1")     //when Button1 is clicked...
        self.editTimeAvailable()
            break
        case Constants.ProfileFields.Proximity: print("2")     //when Button2 is clicked...
        self.editProximity()
            break
        case Constants.ProfileFields.Skills: print("3")     //when Button3 is clicked...
        self.editSkills()
            break
        case Constants.ProfileFields.Experience: print("4")     //when Button3 is clicked...
        self.editExperience()
            break
        case Constants.ProfileFields.Qualification: print("5")     //when Button3 is clicked...
        self.editQualification()
            break
        case Constants.ProfileFields.PreferedLocation: print("6")     //when Button3 is clicked...
        self.editPreferedLocation()
            break
        case Constants.ProfileFields.Appearance: print("7")     //when Button3 is clicked...
        self.editAppearance()
            break
        case Constants.ProfileFields.CertificatonsDocuments: print("8")     //when Button3 is clicked...
        self.editCertificates()
            break
        case Constants.ProfileFields.Accreditation: print("9")     //when Button3 is clicked...
        self.editAccreditation()
            break
        default: print("Other...")
        }
        self.myTableView.reloadData()
        // Animate the removal of the selected row
        myTableView.beginUpdates()
        myTableView.endUpdates()
        
    }
    
    func resetAll(){
        self.isAboutMeFieldOpen = false;
        self.isTimeVavailableFieldOpen = false;
        self.isProximityFieldOpen = false;
        self.isSkillsFieldOpen = false;
        self.isExperienceFieldOpen = false;
        self.isQualificationFieldOpen = false;
        self.isPrefferedLocationFieldOpen = false;
        self.isAppearanceFieldOpen = false;
        self.isCertificationFieldOpen = false;
        self.isAccredationFieldOpen = false;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(isProfilePreviewMode == true)
        {
            if(indexPath.row == Constants.ProfileFields.AboutMe){
                return CGFloat(ProfileFieldsHeights.AboutMe)
            }
            else if(indexPath.row == Constants.ProfileFields.TimeAvailability){
                return CGFloat(ProfileFieldsHeights.TimeAvailability)
            }
            else if(indexPath.row == Constants.ProfileFields.Proximity){
                return CGFloat(ProfileFieldsHeights.Proximity)
            }
            else if(indexPath.row == Constants.ProfileFields.Skills){
                return CGFloat(ProfileFieldsHeights.Skills)
            }
            else if(indexPath.row == Constants.ProfileFields.Experience){
                return CGFloat(ProfileFieldsHeights.Experience)
            }
            else if(indexPath.row == Constants.ProfileFields.Qualification){
                return CGFloat(ProfileFieldsHeights.Qualification)
            }
            else if(indexPath.row == Constants.ProfileFields.PreferedLocation){
                return CGFloat(ProfileFieldsHeights.PreferedLocation)
            }
            else if(indexPath.row == Constants.ProfileFields.Appearance){
                return CGFloat(ProfileFieldsHeights.Appearance)
            }
            else if(indexPath.row == Constants.ProfileFields.CertificatonsDocuments){
                return CGFloat(ProfileFieldsHeights.CertificatonsDocuments)
            }
            else if(indexPath.row == Constants.ProfileFields.Accreditation){
                return CGFloat(ProfileFieldsHeights.Accreditation)
                
            }
            return 0
        }
        else{
            if(isAboutMeFieldOpen == true && indexPath.row == self.selectedEditField){
                return CGFloat(ProfileFieldsHeights.AboutMe)
            }
            else if(isTimeVavailableFieldOpen == true && indexPath.row == self.selectedEditField){
                return CGFloat(ProfileFieldsHeights.TimeAvailability)
            }
            else if(isProximityFieldOpen == true && indexPath.row == self.selectedEditField){
                return CGFloat(ProfileFieldsHeights.Proximity)
            }
            else if(isSkillsFieldOpen == true && indexPath.row == self.selectedEditField){
                return CGFloat(ProfileFieldsHeights.Skills)
            }
            else if(isExperienceFieldOpen == true && indexPath.row == self.selectedEditField){
                return CGFloat(ProfileFieldsHeights.Experience)
            }
            else if(isQualificationFieldOpen == true && indexPath.row == self.selectedEditField){
                return CGFloat(ProfileFieldsHeights.Qualification)
            }
            else if(isPrefferedLocationFieldOpen == true && indexPath.row == self.selectedEditField){
                return CGFloat(ProfileFieldsHeights.PreferedLocation)
            }
            else if(isAppearanceFieldOpen == true && indexPath.row == self.selectedEditField){
                return CGFloat(ProfileFieldsHeights.Appearance)
            }
            else if(isCertificationFieldOpen == true && indexPath.row == self.selectedEditField){
                return CGFloat(ProfileFieldsHeights.CertificatonsDocuments)
            }
            else if(isAccredationFieldOpen == true && indexPath.row == self.selectedEditField){
                return CGFloat(ProfileFieldsHeights.Accreditation)
            }
                
            else{
                return CGFloat(ProfileFieldsHeights.Common)
                
            }
        }
    }
    
    
    
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    
    func openCommentsVC() {
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.employeeStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "CommentsVC")
        self.navigationController?.pushViewController(navigationVc, animated: true)
        
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
    
    func openEditPreviewVC() {
        // let employeeFlowStoryBoard = UIStoryboard(name: Constants.employeeStoryBoard, bundle: nil)
        //  let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "MyProfileVC")
        //  self.navigationController?.pushViewController(navigationVc, animated: true)
        
        myTableView.tableHeaderView = myProfileHeaderEditable;
        myProfileHeaderEditable.doneProfileButton.addTarget(self,action:#selector(doneProfilePic),
                                                            for:.touchUpInside)
        myProfileHeaderEditable.profileImageView.image = UIImage(named: "add-image_3x.png")
        myProfileHeaderEditable.profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        myProfileHeaderEditable.profileImageView.isUserInteractionEnabled = true //also can be set via storyboard
        myProfileHeaderEditable.nameTitleTextField.text = wageSpoonBO?.data?.eeInfo?.name
        myProfileHeaderEditable.detailsTextField.text = wageSpoonBO?.data?.eeInfo?.title
    }
    
    func doneProfilePic(){
        myTableView.tableHeaderView = myProfileHeader;
    }
    
    func editAboutMe() {
        if(self.selectedEditField != Constants.ProfileFields.AboutMe)
        {
            self.selectedEditField = Constants.ProfileFields.AboutMe
            self.isAboutMeFieldOpen = true;
        }
        else
        {
            self.selectedEditField = -1
            self.isAboutMeFieldOpen = false;
        }
        
    }
    
    func editTimeAvailable() {
        if(self.selectedEditField != Constants.ProfileFields.TimeAvailability)
        {
            self.selectedEditField = Constants.ProfileFields.TimeAvailability
            self.isTimeVavailableFieldOpen = true;
        }
        else
        {
            self.selectedEditField = -1
            self.isTimeVavailableFieldOpen = false;
            self.updateTimeAvailable()
        }
        
    }
    
    func editProximity() {
        if(self.selectedEditField != Constants.ProfileFields.Proximity)
        {
            self.selectedEditField = Constants.ProfileFields.Proximity
            self.isProximityFieldOpen = true;
        }
        else
        {
            self.selectedEditField = -1
            self.isProximityFieldOpen = false;
            
        }
    }
    
    
    func editSkills() {
        if(self.selectedEditField != Constants.ProfileFields.Skills)
        {
            self.selectedEditField = Constants.ProfileFields.Skills
            self.isSkillsFieldOpen = true;
        }
        else
        {
            self.selectedEditField = -1
            self.isSkillsFieldOpen = false;
        }
    }
    
    func editExperience() {
        if(self.selectedEditField != Constants.ProfileFields.Experience)
        {
            self.selectedEditField = Constants.ProfileFields.Experience
            self.isExperienceFieldOpen = true;
        }
        else
        {
            self.selectedEditField = -1
            self.isExperienceFieldOpen = false;
        }
        // self.updateTimeAvailable()
    }
    
    func editQualification(){
        if(self.selectedEditField != Constants.ProfileFields.Qualification){
            self.selectedEditField = Constants.ProfileFields.Qualification
            self.isQualificationFieldOpen = true;
        }
        else
        {
            self.selectedEditField = -1
            self.isQualificationFieldOpen = false;
        }
    }
    
    
    func editPreferedLocation() {
        if(self.selectedEditField != Constants.ProfileFields.PreferedLocation){
            self.selectedEditField = Constants.ProfileFields.PreferedLocation
            self.isPrefferedLocationFieldOpen = true;
        }
        else
        {
            self.selectedEditField = -1
            self.isPrefferedLocationFieldOpen = true;
        }
        self.updateQualification()
    }
    
    func editAppearance() {
        if(self.selectedEditField != Constants.ProfileFields.Appearance){
            self.selectedEditField = Constants.ProfileFields.Appearance
            self.isAppearanceFieldOpen = true;
        }
        else
        {
            self.selectedEditField = -1
            self.isAppearanceFieldOpen = true;
        }
    }
    
    func editCertificates(){
        if(self.selectedEditField != Constants.ProfileFields.CertificatonsDocuments){
            self.selectedEditField = Constants.ProfileFields.CertificatonsDocuments
            self.isCertificationFieldOpen = true;
        }
        else
        {
            self.selectedEditField = -1
            self.isCertificationFieldOpen = true;
        }
        
    }
    
    func editAccreditation() {
        if(self.selectedEditField != Constants.ProfileFields.Accreditation){
            self.selectedEditField = Constants.ProfileFields.Accreditation
            self.isAccredationFieldOpen = true;
        }
        else
        {
            self.selectedEditField = -1
            self.isAccredationFieldOpen = false;
        }
    }
    
    
    func setupViewsWithJobInfo(_ jobDetailModel: ModelJobDetail)  {
        //        self.headingTextField.text = jobDetailModel.title
        //        self.descTextView.text = jobDetailModel.descriptionValue
        //        self.descTextView.textColor = UIColor.black
        //        self.locationTextField.text = jobDetailModel.location
        //        self.budgetTextField.text = jobDetailModel.budget
        //        self.currencyTextField.text = jobDetailModel.currency
        //        self.locationLat = Double(jobDetailModel.latitude!)!
        //        self.locationLng = Double(jobDetailModel.longitude!)!
        //        self.startTimeButton.setTitle(jobDetailModel.startTime, for: .normal)
        //        self.dueDateButton.setTitle(jobDetailModel.endTime, for: .normal)
        //        //
        //        self.imageview1.kf.setImage(with: URL(string: Constants.HTTP.HOST_IMAGE+jobDetailModel.image1!)!, placeholder: UIImage.init(named: ""))
        //        self.imageview2.kf.setImage(with: URL(string: Constants.HTTP.HOST_IMAGE+jobDetailModel.image2!)!, placeholder: UIImage.init(named: ""))
        //        self.imageview3.kf.setImage(with: URL(string: Constants.HTTP.HOST_IMAGE+jobDetailModel.image3!)!, placeholder: UIImage.init(named: ""))
        //
        //        self.previousImage1 = jobDetailModel.image1!
        //        self.previousImage2 = jobDetailModel.image2!
        //        self.previousImage3 = jobDetailModel.image3!
        //
        //        imageview1.isUserInteractionEnabled = false
        //        imageview2.isUserInteractionEnabled = false
        //        imageview3.isUserInteractionEnabled = false
    }
    
    func getProfile()
    {
        let parameters: Parameters = ["target_type":"0",
                                      "target_id":"3"]
        
        Alamofire.request(Constants.HTTP.HOST+Constants.HTTP.FindUserUrl, method: .post, parameters: nil, headers: nil).responseJSON { (response:DataResponse) in
            
            if let data = Common.dealResult(response) {
                Common.showHUD("Success!", 1.5)
                print(response)
                let jobDetailModel = ModelJobDetail.init()
                jobDetailModel.setInfo(item: data)
                self.setupViewsWithJobInfo(jobDetailModel)
                if data.count > 0 {
                    
                }
                else{
                    Common.showHUD("Update Failed", 1.5)
                }
            }
            self.stopHud()
        }
        
    }
    
    func updateTimeAvailable()
    {
        let parameters: Parameters = ["fixed_date_from":self.timeAvailabilityModel.fixed_date_from ?? "",
                                      "fixed_date_to":self.timeAvailabilityModel.fixed_date_to ?? "",
                                      "part_time_from":self.timeAvailabilityModel.part_time_from ?? "",
                                      "part_time_to":self.timeAvailabilityModel.part_time_to ?? "",
                                      "part_time_mon":self.timeAvailabilityModel.part_time_mon ?? "",
                                      "part_time_tue":self.timeAvailabilityModel.part_time_tue ?? "",
                                      "part_time_wed":self.timeAvailabilityModel.part_time_wed ?? "",
                                      "part_time_thu":self.timeAvailabilityModel.part_time_thu ?? "",
                                      "part_time_fri":self.timeAvailabilityModel.part_time_fri ?? "",
                                      "part_time_sat":self.timeAvailabilityModel.part_time_sat ?? "",
                                      "part_time_sun":self.timeAvailabilityModel.part_time_sun ?? "",
                                      "time_availability_id":self.timeAvailabilityModel.time_availability_id ?? "",
                                      ]
        Alamofire.request(Constants.HTTP.HOST+Constants.HTTP.UpdateTimeAvailabilityUrl, method: .post, parameters: parameters, headers: nil).responseJSON { (response:DataResponse) in
            
            if let data = Common.dealResult(response) {
                Common.showHUD("Updated Success!", 1.5)
                print(response)
                if data.count > 0 {
                    
                }
                else{
                    Common.showHUD("Update Failed", 1.5)
                }
            }
            self.stopHud()
        }
        
    }
    
    func updateQualification()
    {
        //        let parameters: Parameters = ["qulaification_name":self.qualificationModel.qualification_name ?? "",
        //                                      "qulaification_from":self.qualificationModel.qualification_from ?? "",
        //                                      "qulaification_to":self.qualificationModel.qualification_to ?? "",
        //                                      "qualification_id":self.qualificationModel.qualification_id ?? ""]
        //        Alamofire.request(Constants.HTTP.HOST+Constants.HTTP.UpdateQualificationUrl, method: .post, parameters: parameters, headers: nil).responseJSON { (response:DataResponse) in
        //
        //            if let data = Common.dealResult(response) {
        //                Common.showHUD("Updated Success!", 1.5)
        //                print(response)
        //                if data.count > 0 {
        //
        //                }
        //                else{
        //                    Common.showHUD("Update Failed", 1.5)
        //                }
        //            }
        //            self.stopHud()
        //        }
        
    }
    
    
    @IBAction func imageTapped(sender: UITapGestureRecognizer) {
        imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        if(newImageView.image == UIImage(named:"add-image_3x.png")){
            present(imagePicker, animated: true, completion: nil)
        }else{
            newImageView.frame = UIScreen.main.bounds
            newImageView.backgroundColor = .black
            newImageView.contentMode = .scaleAspectFit
            newImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
            newImageView.addGestureRecognizer(tap)
            self.view.addSubview(newImageView)
            self.navigationController?.isNavigationBarHidden = true
            self.tabBarController?.tabBar.isHidden = true
        }
        
    }
    
    func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFill
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func acceptedForJob() {
        if(isAcceptedForJob == true)
        {
            showOverlay(type: MessageViewController.self, fromStoryboardWithName: "Employee")
        }else
        {
            isAcceptedForJob = true
            Common.showHUD("Accepted for Job", 1.0)
        }
    }
    
    func rejectedForJob() {
        //showOverlay(type: MessageViewController.self, fromStoryboardWithName: "Employee")
    }
}


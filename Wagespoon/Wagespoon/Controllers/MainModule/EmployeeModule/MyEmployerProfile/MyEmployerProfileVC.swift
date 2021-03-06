//
//  MyProfileVC.swift
//  Wagespoon
//
//  Created by Ravi on 02/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
//
//
//
//


import UIKit
struct EmployerProfileFieldsHeights{
    static let Common = 48
    static let AboutMe = 240
    static let TimeAvailability =  240
    static let Proximity =  240
    static let Skills = 240
    static let Experience = 240
    static let Qualification = 240
    static let PreferedLocation = 240
    static let Appearance = 240
    static let CertificatonsDocuments = 240
    static let Accreditation = 240
}
class MyEmployerProfileVC: WSParent, UITableViewDataSource, UITableViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
    
        var imageView : UIImageView!
        @IBOutlet var myTableView: UITableView!
        let imagePicker = UIImagePickerController()
        //  var myTableView: UITableView  =   UITableView()
        var itemsToLoad: [String] = ["About Company", "Company Description", "GST", "Credit Card", "Established On", "Industry", "Ratings"]
        var wageSpoonBO: EmployerBOWageSpoon?
        var myProfileHeader: MyCompanyProfileHeader!
        var myProfileHeaderEditable: MyCompanyProfileHeaderEditable!
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            intializeView()
            wageSpoonBO = EmployerSessionManager.sharedInstance.getCacheUserProfile()
            setProfileData()
            imagePicker.delegate = self
    }
    
    func setProfileData() {
        myProfileHeader.imageView.setImageWithUrl(URL(string:(wageSpoonBO?.data?.erInfo?.profilePic)!)!, placeHolderImage: UIImage(named: "default_pic"))
    }
        
        // MARK: - initializeView Methods
        func intializeView(){
            self.headerView.titleLabel.text = wageSpoonBO?.data?.erInfo?.name
            myTableView.dataSource = self
            myTableView.delegate = self
            myProfileHeader = MyCompanyProfileHeader.instanceFromNib() as! MyCompanyProfileHeader
            myProfileHeaderEditable = MyCompanyProfileHeaderEditable.instanceFromNib() as! MyCompanyProfileHeaderEditable
            myProfileHeader.createAJobButton.addTarget(self, action: #selector(openCreateAJobVC), for:.touchUpInside)
            myProfileHeader.editProfileButton.addTarget(self, action: #selector(openEditPreviewVC), for:.touchUpInside)
            myTableView.tableHeaderView = myProfileHeader;
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
            if(isAboutMeFieldOpen == true && indexPath.row == self.selectedEditField){
                
                return getAboutMeCell(tableView: tableView,indexPath: indexPath)
            }
            else if(isTimeVavailableFieldOpen == true && indexPath.row == self.selectedEditField){
                
                return getAboutMeCell(tableView: tableView,indexPath: indexPath)
                //return getTimeAvlbCell(tableView: tableView,indexPath: indexPath)
            }
            else if(isProximityFieldOpen == true && indexPath.row == self.selectedEditField){
                
                  return getAboutMeCell(tableView: tableView,indexPath: indexPath)
                //return getProximityCell(tableView: tableView,indexPath: indexPath)
            }
            else if(isSkillsFieldOpen == true && indexPath.row == self.selectedEditField){
                
                  return getAboutMeCell(tableView: tableView,indexPath: indexPath)
               // return getSkillsCell(tableView: tableView,indexPath: indexPath)
                
            }
            else if(isExperienceFieldOpen == true && indexPath.row == self.selectedEditField){
              
                return getAboutMeCell(tableView: tableView,indexPath: indexPath)
                // return getExperienceCell(tableView: tableView,indexPath: indexPath)
            }
                
            else if(isQualificationFieldOpen == true && indexPath.row == self.selectedEditField){
                
                return getAboutMeCell(tableView: tableView,indexPath: indexPath)
                // return getQualificationCell(tableView: tableView, indexPath:indexPath)
            }
            else if(isPrefferedLocationFieldOpen == true && indexPath.row == self.selectedEditField){
               
                return getAboutMeCell(tableView: tableView,indexPath: indexPath)
                // return getPreferredLocationCell(tableView: tableView, indexPath:indexPath)
                
            }
            else if(isAppearanceFieldOpen == true && indexPath.row == self.selectedEditField){
              
                return getAboutMeCell(tableView: tableView,indexPath: indexPath)
                // return getAppearanceCell(tableView: tableView, indexPath:indexPath)
                
            }
            else if(isCertificationFieldOpen == true && indexPath.row == self.selectedEditField){
                
                  return getAboutMeCell(tableView: tableView,indexPath: indexPath)
                //return getCommunicationCell(tableView: tableView, indexPath:indexPath)
                
            }
            else if(isAccredationFieldOpen == true && indexPath.row == self.selectedEditField){
                
                return getAboutMeCell(tableView: tableView,indexPath: indexPath)
                //return getAccreditationCell(tableView: tableView, indexPath:indexPath)
                
            }
            else
            {
                return getCommonCell(tableView: tableView, indexPath:indexPath)
                
            }
            
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])")
        }
        func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
            return CGRect(x: x, y: y, width: width, height: height)
        }
    
    func openEditPreviewVC() {
        
        myTableView.tableHeaderView = myProfileHeaderEditable;
        myProfileHeaderEditable.doneProfileButton.addTarget(self,action:#selector(doneProfilePic),
                                                            for:.touchUpInside)
        myProfileHeaderEditable.imageView.image = UIImage(named: "add-image_3x.png")
        myProfileHeaderEditable.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        myProfileHeaderEditable.imageView.isUserInteractionEnabled = true //also can be set via storyboard
        
    }
    
    func openCreateAJobVC() {
       let employeeFlowStoryBoard = UIStoryboard(name: Constants.employerStoryBoard, bundle: nil)
       let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "CreateAJobVC")
       self.navigationController?.pushViewController(navigationVc, animated: true)
    
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
        //  self.navigationController?.isNavigationBarHidden = false
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

    
    func doneProfilePic(){
        myTableView.tableHeaderView = myProfileHeader;
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
        // cell?.pickerImageButton.addTarget(self, action: #selector(loadImageButtonTapped(sender:)), for: .touchUpInside)
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:)))
        cell?.pickerImageView.addGestureRecognizer(pictureTap)
        cell?.pickerImageView.isUserInteractionEnabled = true //also can be set via storyboard
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
        
        
        cell?.documentImage1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        
        cell?.documentImage2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        
        cell?.documentImage3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        
        cell?.documentImage4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:))))
        
        cell?.documentImage1.isUserInteractionEnabled = true //also can be set via storyboard
        
        cell?.documentImage2.isUserInteractionEnabled = true //also can be set via storyboard
        
        cell?.documentImage3.isUserInteractionEnabled = true //also can be set via storyboard
        
        cell?.documentImage4.isUserInteractionEnabled = true //also can be set via storyboard
     
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
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(isAboutMeFieldOpen == true && indexPath.row == self.selectedEditField){
            return CGFloat(EmployerProfileFieldsHeights.AboutMe)
        }
        else if(isTimeVavailableFieldOpen == true && indexPath.row == self.selectedEditField){
            return CGFloat(EmployerProfileFieldsHeights.TimeAvailability)
        }
        else if(isProximityFieldOpen == true && indexPath.row == self.selectedEditField){
            return CGFloat(EmployerProfileFieldsHeights.Proximity)
        }
        else if(isSkillsFieldOpen == true && indexPath.row == self.selectedEditField){
            return CGFloat(EmployerProfileFieldsHeights.Skills)
        }
        else if(isExperienceFieldOpen == true && indexPath.row == self.selectedEditField){
            return CGFloat(EmployerProfileFieldsHeights.Experience)
        }
        else if(isQualificationFieldOpen == true && indexPath.row == self.selectedEditField){
            return CGFloat(EmployerProfileFieldsHeights.Qualification)
        }
        else if(isPrefferedLocationFieldOpen == true && indexPath.row == self.selectedEditField){
            return CGFloat(EmployerProfileFieldsHeights.PreferedLocation)
        }
        else if(isAppearanceFieldOpen == true && indexPath.row == self.selectedEditField){
            return CGFloat(EmployerProfileFieldsHeights.Appearance)
        }
        else if(isCertificationFieldOpen == true && indexPath.row == self.selectedEditField){
            return CGFloat(EmployerProfileFieldsHeights.CertificatonsDocuments)
        }
        else if(isAccredationFieldOpen == true && indexPath.row == self.selectedEditField){
            return CGFloat(EmployerProfileFieldsHeights.Accreditation)
        }
            
        else{
            return CGFloat(EmployerProfileFieldsHeights.Common)
            
        }
    }
    
}


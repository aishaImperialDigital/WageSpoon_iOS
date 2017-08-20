//
//  WSParent.swift
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit

class WSParent: UIViewController {
    var hud: MBProgressHUD?
    var headerView: AppHeader!
    var backHeaderView: BackHeader!
    var isHeaderViewRequired : Bool = true

  //  @property(nonatomic,strong) VoomDatePickerView *datePicker;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.clipsToBounds = true
        self.navigationController?.navigationBar.isHidden = true;
        Constants.appDelegate.appTabBar?.tabBar.clipsToBounds = true;
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        if(isHeaderViewRequired){
            addHeader()
        }
        else{
            addBackHeader()
        }
        initHud()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addHeader(){
        headerView = AppHeader.instanceFromNib() as! AppHeader
        headerView.sideMenuButton.addTarget(self,action:#selector(menuButtonClicked), for:.touchUpInside)
        self.view.addSubview(headerView);
    }
    
    func addBackHeader(){
        headerView.removeFromSuperview()
        backHeaderView = BackHeader.instanceFromNib() as! BackHeader
        backHeaderView.backButton.addTarget(self,action:#selector(backButtonClicked), for:.touchUpInside)
        self.view.addSubview(backHeaderView);
    }
    
    func menuButtonClicked()  {
       self.menuContainerViewController.toggleLeftSideMenuCompletion( nil)
    }
    
    func backButtonClicked()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    func initHud() {
        hud = MBProgressHUD.init(view: self.view)
        hud?.mode = MBProgressHUDMode.indeterminate
        hud?.bezelView.backgroundColor = UIColor.black
        hud?.contentColor = UIColor.white
        hud?.tintColor = UIColor.white
        hud?.bezelView.alpha = 0.99
        hud?.offset.y = -56
        hud?.margin = 14
    }
    
    func startHud() {
        if hud != nil {
            self.view.addSubview(hud!)
            hud?.show(animated: true)
        }
    }
    
    func stopHud() {
        hud?.hide(animated: true)
        hud?.removeFromSuperview()
    }
    
    
    
}
extension UIColor {
    convenience init(_ red: Int, _ green: Int, _ blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(_ netHex:Int) {
        self.init((netHex >> 16) & 0xff, (netHex >> 8) & 0xff, netHex & 0xff)
    }
    
    convenience init(_ netHex:Int, alpha: CGFloat) {
        self.init((netHex >> 16) & 0xff, (netHex >> 8) & 0xff, netHex & 0xff, alpha)
    }
}

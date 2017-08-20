//
//  BaseVC.swift
//  Wagespoon
//
//  Created by Ravi on 18/06/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import Foundation

// Naviagtion type enum
enum NavigationType:Int {case ClearNavigationType = 0, BlueNavigationType = 1, WhiteNavigationType = 2,CleanBlueNavigationType = 3}

@objc class BaseVC: UIViewController,UIGestureRecognizerDelegate{
    var hud: MBProgressHUD?
    // objects
    var countNotification = 0

    //MARK: -  Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //  self.navigationController?.interactivePopGestureRecognizer?.delegate = self;

        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().isEnableAutoToolbar = true
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        self.automaticallyAdjustsScrollViewInsets = false

        // Do any additional setup after loading the view.
        initHud()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: -  Action
    // Used to set the type of Navigation Bar

    func setNavigationBar(typeNavigation:NavigationType)
    {


        self.navigationItem.setHidesBackButton(false, animated: true)
        if typeNavigation == NavigationType.ClearNavigationType
        {
            self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 14)!,  NSForegroundColorAttributeName: UIColor.white]
            self.navigationController!.navigationBar.isTranslucent = true
            //  self.navigationController!.navigationBar.barStyle = UIBarStyle.BlackOpaque
            self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController!.navigationBar.shadowImage = UIImage()
            self.navigationController!.navigationBar.tintColor = UIColor.white
            self.navigationController!.navigationBar.isTranslucent = true
            self.navigationController?.isNavigationBarHidden = false
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        }
        else if typeNavigation == NavigationType.BlueNavigationType{

            self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 14)!,  NSForegroundColorAttributeName: UIColor.white
            ]
            self.navigationController!.navigationBar.isTranslucent = true
            self.navigationController!.navigationBar.barStyle = UIBarStyle.black
            self.navigationController!.navigationBar.barTintColor = UIColor(red: 29/255.0, green: 179/255.0, blue: 233/255.0, alpha: 1.0)
            self.navigationController!.navigationBar.tintColor = UIColor.white
            self.navigationController!.navigationBar.setBackgroundImage(UIImage(named:""), for: UIBarMetrics.default)
            self.navigationController!.navigationBar.shadowImage = nil
            self.navigationController?.isNavigationBarHidden = false
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        }
        else if typeNavigation == NavigationType.WhiteNavigationType{

            self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 14)!,  NSForegroundColorAttributeName: UIColor.black]
            self.navigationController!.navigationBar.isTranslucent = true
            self.navigationController!.navigationBar.barStyle = UIBarStyle.black
            self.navigationController!.navigationBar.barTintColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
            self.navigationController!.navigationBar.tintColor = UIColor(red: 59/255.0, green: 124/255.0, blue: 243/255.0, alpha: 1.0)
            self.navigationController!.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
            self.navigationController!.navigationBar.shadowImage = nil
            self.navigationController?.isNavigationBarHidden = false
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        }
        else{





            self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 14)!,  NSForegroundColorAttributeName: UIColor.white]
            self.navigationController!.navigationBar.isTranslucent = true
            // self.navigationController!.navigationBar.barStyle = UIBarStyle.BlackOpaque
            self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController!.navigationBar.shadowImage = UIImage()
            self.navigationController!.navigationBar.tintColor = UIColor(red: 59/255.0, green: 124/255.0, blue: 243/255.0, alpha: 1.0)
            self.navigationController!.navigationBar.isTranslucent = true
            self.navigationController?.isNavigationBarHidden = false
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true


        }

    }

    // used to enable back fingure gesture
    func allowBackGesture(isAllow:Bool) {

        if(isAllow == true) {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self;

            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        }
        else {

            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false

        }

    }

    // Used to fetch last controller from stack

    func lastViewController()->UIViewController
    {
        let arrayViewControllers:NSArray = self.navigationController!.viewControllers as NSArray
        return arrayViewControllers[arrayViewControllers.count - 2] as! UIViewController
    }

    // Used to fetch any previous controller from stack

    func fetchPreviousControllerFromNavigationStack(stackNoFromLast:Int)->UIViewController
    {
        let arrayViewControllers:NSArray = self.navigationController!.viewControllers as NSArray
        return arrayViewControllers[arrayViewControllers.count - (stackNoFromLast+1)] as! UIViewController
    }

    // Used to check the all textfield is filled or not of the superView

    func isAllTextFieldFilled(superView:UIView) -> Bool
    {
        for case let textField as UITextField in superView.subviews {
            if textField.text == "" {
                return false
            }
        }
        return true
    }


    // Used to Clear all the all textfield of the superView

    func clearAllTextFields(superView:UIView)
    {
        for case let textField as UITextField in superView.subviews {
            textField.text = ""
        }
    }

    // Delete all view in navigation and get back to login
    func deleteAllViewFromsStack() {
        guard let navigationControl = self.navigationController else {
            return
        }
        let array =  navigationControl.viewControllers as NSArray
        if array.count > 0{
            for controller in array{
                if let control = controller as? UIViewController{
                    self.navigationController?.popToViewController(control, animated: false)
                }
            }
        }
    }
    
    
    // MARK: - HomePageToogle
    func toHome(){
        self.deleteAllViewFromsStack()
        // Constants.appDelegate.showHomePageInRoot()
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

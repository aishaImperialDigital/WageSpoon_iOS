//
//  AppDelegate.swift
//  Wagespoon
//
//  Created by Ravi on 17/06/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit
import CoreData
import MFSideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appTabBar:UITabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
       
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
      //  self.saveContext()
    }

    // MARK: - Core Data stack

    @available(iOS 10.0, *)
    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Wagespoon")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

//    func saveContext () {
//        if #available(iOS 10.0, *) {
//            let context = persistentContainer.viewContext
//        } else {
//            // Fallback on earlier versions
//        }
//
//
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }

    func showEmployerStoryboard() {
        
        let mainStoryBoard = UIStoryboard(name: Constants.employeeStoryBoard, bundle: nil)
        self.appTabBar = mainStoryBoard.instantiateViewController(withIdentifier: "TabbarController") as? UITabBarController
        let container: MFSideMenuContainerViewController =  MFSideMenuContainerViewController()
        let leftSideMenuViewController: UIViewController =  mainStoryBoard.instantiateViewController(withIdentifier: "leftSideMenuViewController")
        container.leftMenuViewController = leftSideMenuViewController
        container.centerViewController =  self.appTabBar
       //  self.appTabBar?.viewControllers?.remove(at: 2)
       // self.appTabBar?.viewControllers.a
        self.window?.rootViewController = container
        let employeeFlowStoryBoard = UIStoryboard(name: Constants.employerStoryBoard, bundle: nil)
        let navigationVc = employeeFlowStoryBoard.instantiateViewController(withIdentifier: "MyEmployerProfileVC")
        self.appTabBar?.selectedViewController = Constants.appDelegate.appTabBar?.viewControllers?[2]
        let nav = self.appTabBar?.selectedViewController as! UINavigationController!
        //nav?.pushViewController(navigationVc, animated:true)
        self.appTabBar?.selectedIndex = 0;
        nav?.setViewControllers([navigationVc], animated: true)
        
    }

    func showEmployeeStoryboard() {

        let mainStoryBoard = UIStoryboard(name: Constants.employeeStoryBoard, bundle: nil)
        self.appTabBar = mainStoryBoard.instantiateViewController(withIdentifier: "TabbarController") as? UITabBarController
        let container: MFSideMenuContainerViewController =  MFSideMenuContainerViewController()
        let leftSideMenuViewController: UIViewController =    mainStoryBoard.instantiateViewController(withIdentifier: "leftSideMenuViewController")
        container.leftMenuViewController = leftSideMenuViewController
        container.centerViewController =  self.appTabBar
        self.window?.rootViewController = container

    }
    
    func callLoginModuleStoryBoard(){
        let loginFlowStoryBoard = UIStoryboard(name: Constants.mainStoryBoard, bundle: nil)
        let navigationVc:UINavigationController = loginFlowStoryBoard.instantiateViewController(withIdentifier: "MainModuleNavigationController") as! UINavigationController
        self.window?.rootViewController = navigationVc
        
        
    }
    
   


}


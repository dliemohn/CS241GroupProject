//
//  AppDelegate.swift
//  STVE, dining information
//
//  Created by Will on 4/19/19.
//  Copyright © 2019 OberlinCS241Group. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    guard let diningVenues: [Venue] = MenuParser.getVenues();
    else throw MenuParser.ParsingError.HTMLError
    
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = HomeViewController()
        homeViewController.view.backgroundColor = UIColor.red
        //connects window to viewController
        window!.rootViewController = homeViewController
        //makes things actually visable 
        window!.makeKeyAndVisible()
        
        var diningVenuePages: Array<DiningHallViewController> = Array()
        var i = 0
        for venue in diningVenues {
            diningVenuePages[i] = DiningHallViewController(venue.name)//let diningVenu
        }

        print("\n\nWe can do stuff in here!\n")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}


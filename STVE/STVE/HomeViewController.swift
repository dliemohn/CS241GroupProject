//
//  ViewController.swift
//  STVE, dining information
//
//  Created by Will on 4/19/19.
//  Copyright © 2019 OberlinCS241Group. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: Properties

//    //DINING HALLS LIST
//
//    //STEVENSON
//    @IBAction func StevensonButtonPressed(_ sender: AnyObject) {
//        print("Stevenson Button Pressed")
//        //any object? or is Any fine
//        self.performSegue(withIdentifier: "StevensonPageSegue", sender: self)
//    }
//
//    @IBAction func LordSaundersButtonPressed(_ sender: Any) {
//        print("Lord/Saunders Button Pressed")
//        self.performSegue(withIdentifier: "LordSaundersPageSegue", sender: self)
//    }
//
//    @IBAction func WilderDecafeButtonPressed(_ sender: Any) {
//        print("Wilder Decafe Button Pressed")
//        self.performSegue(withIdentifier: "WilderDecafePageSegue", sender: self)
//    }
//
//    @IBAction func RathskellerButtonPressed(_ sender: Any) {
//        print("Rathskeller Button Pressed")
//        self.performSegue(withIdentifier: "RathskellerPageSegue", sender: self)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Entered STVE Home View")
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        //let screenHeight = screenSize.height
        
        //STVE Title Label
        let stveLabel = UILabel(frame: CGRect(x: 0, y: 20, width: screenWidth, height: 50))
        stveLabel.backgroundColor = .green
        stveLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        
        stveLabel.font = UIFont(name: "Menlo-Bold", size: 30)
        stveLabel.adjustsFontSizeToFitWidth = true
        stveLabel.adjustsFontForContentSizeCategory = true
        stveLabel.text = "STVE, Dining Information"
        stveLabel.textAlignment = .center
        self.view.addSubview(stveLabel)
        
        //Add dining venue buttons
        let diningVenues = ["Stevenson", "Wilder Decafe", "Rathskeller", "Lord/Saunders", "Sky Bar", "Azariah's"]
        var y = 0
        for venue in diningVenues {
            let diningHallButton = makeDingingHallButton(xval: 10, yval: 100 + 60*y,
                height: 50,
                width: Int(screenWidth) - 10,
                diningVenue: venue)
            y += 1
            self.view.addSubview(diningHallButton)
        }
        // Do any additional setup after loading the view.

        //MARK: Actions
        
        
        
    }
    
    func makeDingingHallButton(xval: Int, yval: Int, height: Int, width: Int, diningVenue: String) -> UIButton {
        let returnButton = UIButton(frame: CGRect(x: xval, y: yval, width: width, height: height))
        returnButton.backgroundColor = .green
        returnButton.setTitle(diningVenue, for: .normal)
        returnButton.contentHorizontalAlignment = .left
        returnButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return returnButton
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print((sender.currentTitle ?? "Dining Venue ") + " Page Button tapped")
        //print("Page Button tapped")
        //self.performSegue(withIdentifier: "ReturnSegue", sender: self)
    }
    
}


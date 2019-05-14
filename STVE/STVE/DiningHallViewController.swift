//
//  DiningVenuePage.swift
//  STVE, dining information
//
//  Created by Will on 5/13/19.
//  Copyright © 2019 OberlinCS241Group. All rights reserved.
//

import UIKit

class DiningHallViewController: UIViewController {
    
    var diningVenueName: String!
    
    //let diningVenueName: String
    convenience init(diningVenueName: String) {
        self.init(nibName: nil, bundle: nil)
        self.diningVenueName = diningVenueName
    }
    
    //extend superclass
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    // This is also necessary when extending the superclass.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // or see Roman Sausarnes's answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("I hope this works")
        print(self.diningVenueName ?? "Dining Venue")
        let returnButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        returnButton.backgroundColor = .green
        returnButton.setTitle("Return", for: .normal)
        returnButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        self.view.addSubview(returnButton)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Return Button tapped")
        self.performSegue(withIdentifier: "ReturnSegue", sender: self)
    }
}


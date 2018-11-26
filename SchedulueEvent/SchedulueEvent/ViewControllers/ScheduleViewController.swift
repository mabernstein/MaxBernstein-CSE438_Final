//
//  ViewController.swift
//  Squad-ScheduleView_2
//
//  Created by Max Bernstein on 11/20/18.
//  Copyright © 2018 Max Bernstein. All rights reserved.
//

import UIKit

class ScheduleViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var startDay: Date!
    var endDay: Date!
    var numberOfDays: Int!
    
    var data = [[[Int]]]()
   
    
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(startDay)
        print(endDay)
        print(numberOfDays)
    }
   
}




//
//  ViewController.swift
//  Squad-ScheduleView_2
//
//  Created by Max Bernstein on 11/13/18.
//  Copyright © 2018 Max Bernstein. All rights reserved.
//

import UIKit

class ScheduleViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    

//    static var timeData = Array(0...23)

    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(hourCell.self, forCellWithReuseIdentifier: "cellId")
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ScheduleViewController.timeData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! hourCell
        
        let time = indexPath.row
        cell.time = time
        
        if time == 0 {
            cell.timeLabel.text = ""
        }
        else if time < 12 {
            cell.timeLabel.text = "\(time) AM"
        }
        else if time == 12 {
            cell.timeLabel.text = "\(time) PM"
        }
        else if time < 24 {
            cell.timeLabel.text = "\(time-12) PM"
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


struct timeDataStruct {
    let time: Int?
    let selectTime: [Bool]
}



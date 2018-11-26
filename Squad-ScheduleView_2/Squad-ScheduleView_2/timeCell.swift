//
//  timeCell.swift
//  Squad-ScheduleView_2
//
//  Created by Max Bernstein on 11/13/18.
//  Copyright © 2018 Max Bernstein. All rights reserved.
//

import UIKit

class hourCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.red
    }
}

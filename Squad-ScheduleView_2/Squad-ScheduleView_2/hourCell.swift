//
//  hourCell.swift
//  Squad-ScheduleView_2
//
//  Created by Max Bernstein on 11/13/18.
//  Copyright © 2018 Max Bernstein. All rights reserved.
//

import UIKit

class hourCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    var timeSubData = ScheduleViewController.timeData[IndexPath]
    var time: Int = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    
    let selectCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        
        return collectionView
    }()
    
        let hourDividerLine: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.darkGray
            view.translatesAutoresizingMaskIntoConstraints = false
    
            return view
        }()
    
    
    private let cellId = "selectCellId"
    
    func setupViews() {
        backgroundColor = UIColor.clear
        
        addSubview(timeLabel)
        addSubview(selectCollectionView)
        addSubview(hourDividerLine)
        
        
        timeLabel.centerYAnchor.constraint(equalTo: self.topAnchor).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        
        
        selectCollectionView.dataSource = self
        selectCollectionView.delegate = self
        selectCollectionView.register(selectCell.self, forCellWithReuseIdentifier: cellId)
        
        selectCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        selectCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        selectCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        selectCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        
        hourDividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        hourDividerLine.centerYAnchor.constraint(equalTo: self.topAnchor).isActive = true
        hourDividerLine.leftAnchor.constraint(equalTo: selectCollectionView.leftAnchor, constant: 0).isActive = true
        hourDividerLine.rightAnchor.constraint(equalTo: selectCollectionView.rightAnchor).isActive = true

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        var timeSubData = ScheduleViewController.timeData[time]
        
        if timeSubData[indexPath.row] == false {
            cell.backgroundColor = UIColor.white
        }
        else if timeSubData[indexPath.row] == true {
            cell.backgroundColor = UIColor.green
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! selectCell
        var timeSubData = ScheduleViewController.timeData[time]

        if cell.backgroundColor == UIColor.white {
            timeSubData[indexPath.row] = true
            cell.backgroundColor = UIColor.green
        }
        else if cell.backgroundColor == UIColor.green {
            timeSubData[indexPath.row] = false
            cell.backgroundColor = UIColor.white
        }



        ScheduleViewController.timeData[time] = timeSubData

        print(time)
        print(timeSubData)
        print(ScheduleViewController.timeData)
        print("------------------------------------------------")
    }


    
}

class selectCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    
//    let topDividerLine: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.darkGray
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//    }()
//
//    let bottomDividerLine: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.darkGray
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//    }()
    
    
    
    func setupViews() {
        backgroundColor = UIColor.white
        
//        addSubview(topDividerLine)
//        addSubview(bottomDividerLine)
        
//        topDividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
//        topDividerLine.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0).isActive = true
//        topDividerLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
//
//        bottomDividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
//        bottomDividerLine.centerYAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        bottomDividerLine.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0).isActive = true
//        bottomDividerLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    }
}






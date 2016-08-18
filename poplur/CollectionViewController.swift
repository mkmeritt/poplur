//
//  CollectionViewController.swift
//  ProfileCreation
//
//  Created by Anthony Ma on 16/8/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let identifier: String = "Cell"
    
    let layout = UICollectionViewFlowLayout()
    
    var collectionView: UICollectionView!
    
    var collectionViewCell: CollectionViewCell?
    
    var videos: [Video] = []
    
    var chosenVideos: NSMutableArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        self.collectionView.frame = self.view.bounds

        
        let width = CGRectGetWidth(self.collectionView.frame) / 2
        
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0

        collectionView.backgroundColor = UIColor.init(red: 30/225, green: 30/225, blue: 30/225, alpha: 1.0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        self.view.addSubview(collectionView)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        APIObject.sharedInstance.getVideos { (userVideos:[Video]) in
            print(userVideos)
            self.videos = userVideos
            self.collectionView.reloadData()
        }
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videos.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.whiteColor() 
        
        
        let video = self.videos[indexPath.item]
        cell.video = video
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        toggleBoldface(cell)
        
        print("touched")
        
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        print("unselected")
    }
}

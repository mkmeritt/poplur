//
//  MainCell.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-10.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    var mainView: MainViewController! = MainViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(mainView.view)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

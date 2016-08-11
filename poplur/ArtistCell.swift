//
//  ArtistCell.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-09.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class ArtistCell: UICollectionViewCell {
    
    var artistView: ArtistViewController! = ArtistViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(artistView.view)
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



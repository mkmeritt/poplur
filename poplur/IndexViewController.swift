//
//  IndexViewController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {
    
    var index:Int

    
    init(index: Int){
        self.index = index
        super.init(nibName: nil, bundle: nil)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.index = 0
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
}

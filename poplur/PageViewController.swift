//
//  ContainerViewController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-10.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    
    
    
    var maxIndex:Int = 3 // you should set this dynamically
    let minIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        let initialViewController = createViewControllerWithIndex(0)
        
        self.view.backgroundColor = UIColor.blackColor()
        
        self.setViewControllers([initialViewController], direction: .Forward, animated: false, completion: nil)

    }
    
    private func createViewControllerWithIndex(index:Int) -> UIViewController {
        print("Index is %d", index)

        switch index {
        case 0:
            return MainViewController(index:index)
        case 1:
            return CityViewController(index:index)
        case 2:
            let storyboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("ArtistVC") as! ArtistViewController
            vc.index = index
            return vc
        default:
            return ArtistViewController(index:index)
        }
        
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! IndexViewController
        var index = vc.index
        if index > maxIndex - 1 {
            return nil
        }
        else{
        index += 1
            
        }
        return createViewControllerWithIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! IndexViewController
        var index = vc.index
        
        if index <= minIndex {
            return nil
        }
        else {
        index -= 1
        }
    
        return createViewControllerWithIndex(index)
    }
    
    
 }

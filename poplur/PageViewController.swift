//
//  ContainerViewController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-10.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var maxIndex:Int = 6 // you should set this dynamically
    let minIndex:Int = 0
    
    var currentIndex: Int = 0
    
    let allPages = [MainViewController(index:0), UserController(index:1), CityViewController(index:2), MovieController(index:3), MovieController(index:4), MovieController(index:5), MovieController(index:6)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        let initialViewController = allPages[0]
        
        self.view.backgroundColor = UIColor.blackColor()
        
        self.setViewControllers([initialViewController], direction: .Forward, animated: false, completion: nil)
        
       
    }
    
    func moveToNextPage () {
        print(currentIndex)
        if(currentIndex == 2) {
            let nextVC = allPages[3]
            self.setViewControllers([nextVC], direction: .Forward, animated: true, completion: nil)
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
        
        currentIndex = index

      /*
        if(currentIndex == 2) {
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(PageViewController.moveToNextPage), userInfo: nil, repeats: false)
            }
        */
        return allPages[index]
        
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
        
        currentIndex = index

        return allPages[index]
    }
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        
        let vc = pendingViewControllers.first as! IndexViewController
        
        var index = vc.index
        
       
        
        
    }
    
    
 }

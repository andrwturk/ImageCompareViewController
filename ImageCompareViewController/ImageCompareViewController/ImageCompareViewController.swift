//
//  ViewController.swift
//  ImageCompareViewController
//
//  Created by Andrew Turkin on 2/26/15.
//  Copyright (c) 2015 Andrew Turkin. All rights reserved.
//

import UIKit

class ImageCompareViewController: UIViewController, UIScrollViewDelegate {
    
    var images = ["carbon.jpg", "classique.jpg", "gold.jpg", "minimal.jpg"]
    var delimeterColor:UIColor = UIColor.redColor()
    
    
    var backgroundView:UIImageView!
    var foregroundView:CompareView!
    var backgroundScrollView:UIScrollView!
    var scrollView:UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        backgroundScrollView = UIScrollView(frame: view.bounds)
        backgroundScrollView.contentSize = view.bounds.size
        backgroundScrollView.alwaysBounceHorizontal = true
        backgroundScrollView.delegate = self
        backgroundScrollView.directionalLockEnabled = true
        view.addSubview(backgroundScrollView)

        backgroundView = UIImageView(frame: view.bounds)
        backgroundView.contentMode = UIViewContentMode.Top
        backgroundScrollView.addSubview(backgroundView)
        let image = UIImage(named: images[0])
        backgroundView.image = image
        
        foregroundView = CompareView(frame:view.bounds)
        backgroundScrollView.addSubview(foregroundView)
        foregroundView.image = UIImage(named: images[1])
        foregroundView.delimeterColor = delimeterColor
        
        scrollView = UIScrollView(frame: view.bounds)
        backgroundScrollView.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.contentSize = CGSizeMake(view.bounds.size.width*CGFloat(images.count), view.bounds.size.height)
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        foregroundView.leftOffset = view.bounds.size.width
    }
    
    var lastIndex:Int = 0
    var lastOffset:CGFloat = 0
    
    enum Direction {
        case Forward
        case Backward
    }
    
    var scrollDirection:Direction = .Forward
    
    func scrollViewDidScroll(aScrollView: UIScrollView) {
        
        if aScrollView == scrollView {
            let offset = scrollView.contentOffset.x
            
            scrollDirection = offset - lastOffset > 0 ? .Forward : .Backward
            
            foregroundView.leftOffset = view.bounds.size.width - offset % view.bounds.size.width
            foregroundView.setNeedsDisplay()
            
            let index = Int(offset / view.bounds.size.width)
            if index != lastIndex {
                updateViewsWithImageIndex(index, forward: scrollDirection == .Forward)
                lastIndex = index
            }
            
            lastOffset = offset
        }
        else {
            
            if (lastIndex == 0 && backgroundScrollView.contentOffset.x > 0) ||
            (lastIndex == images.count-1 && backgroundScrollView.contentOffset.x < 0)
            {
                backgroundScrollView.contentOffset = CGPointZero
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViewsWithImageIndex(index:Int, forward:Bool) {
        
        backgroundView.image = UIImage(named: images[index])
        
//        check bounds and set foreground image
        if index + 1 < images.count {
            foregroundView.image = UIImage(named: images[index+1])
        }
        if forward == true {
            foregroundView.leftOffset = view.bounds.size.width
        }
        else {
            foregroundView.leftOffset = 0
        }
    }
}


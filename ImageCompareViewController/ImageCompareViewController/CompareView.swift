//
//  CompareView.swift
//  ImageCompareViewController
//
//  Created by Andrew Turkin on 2/26/15.
//  Copyright (c) 2015 Andrew Turkin. All rights reserved.
//

import UIKit

class CompareView: UIView {
    
    var leftOffset:CGFloat = 0.0 
    var rightOffset:CGFloat = 0.0
    var image:UIImage?
    var delimeterColor:UIColor!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
        contentMode = UIViewContentMode.Redraw
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func drawRect(rect: CGRect) {
        
        if let anImage = image {
            
            let offsetRect = CGRectMake(bounds.origin.x + leftOffset, bounds.origin.y, bounds.size.width - rightOffset - leftOffset, bounds.size.height)
            
            if offsetRect.size.width > 0 {
                let scaledRect = CGRectMake(offsetRect.origin.x * anImage.scale, offsetRect.origin.y * anImage.scale, offsetRect.size.width * anImage.scale, offsetRect.size.height * anImage.scale)
                
                
                let imageRef = CGImageCreateWithImageInRect(anImage.CGImage, scaledRect)
                
                if let imageResult = UIImage(CGImage: imageRef, scale: anImage.scale, orientation: anImage.imageOrientation) {
                    imageResult.drawInRect(offsetRect)
                    let ctx = UIGraphicsGetCurrentContext()
                    CGContextSetStrokeColorWithColor(ctx, delimeterColor.CGColor)
                    
                    if rightOffset != 0 {
                        CGContextMoveToPoint(ctx, offsetRect.size.width, 0)
                        CGContextAddLineToPoint(ctx, offsetRect.size.width, offsetRect.size.height)
                    }
                    
                    if leftOffset != 0 {
                        CGContextMoveToPoint(ctx, leftOffset, 0)
                        CGContextAddLineToPoint(ctx, leftOffset, offsetRect.size.height)
                    }
                    CGContextStrokePath(ctx)
                }
            }
            
            
        }
        
    }
}

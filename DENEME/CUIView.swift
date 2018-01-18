//


//
//  CUIView.swift
//  CustomUI
//
//  Created by Caner Aksakal on 16/07/15.
//  Copyright (c) 2015 Caner Aksakal. All rights reserved.
//



//  CUIView.swift
//  DENEME
//
//  Changed by Melis Gülenay 18/07/17
//


import UIKit

class CUIView: UIView{
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    fileprivate lazy var zeroHeightConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 0)
    }()
    
    fileprivate lazy var tapRecogniser: UITapGestureRecognizer = {
        var recogniser = UITapGestureRecognizer()
        self.addGestureRecognizer(recogniser)
        return recogniser
    }()
    
    func addTarget(_ target: AnyObject, action: Selector){
        tapRecogniser.addTarget(target, action: action)
    }
    
    func hideByAddingZeroHeightConstraint(_ animationContext: UIView? = nil, completion: (()->Void)? = nil){
        self.zeroHeightConstraint.isActive = true
        self.isHidden = true
        if animationContext != nil{
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                animationContext!.layoutIfNeeded()
            }, completion: { (x: Bool) -> Void in
                completion?()
            })
        }
    }
    
    func unhideByRemovingZeroHeightConstraint(_ animationContext: UIView? = nil, completion: (()->Void)? = nil){
        self.zeroHeightConstraint.isActive = false
        self.isHidden = false
        if animationContext != nil{
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                animationContext!.layoutIfNeeded()
            }, completion: { (x: Bool) -> Void in
                self.isHidden = false
                completion?()
            })
        }else{
            self.isHidden = false
        }
    }
}

extension UIView {
    func hideBySettingAlphaToZero() {
        UIView.animate(withDuration: 0.5,
                       animations: {self.alpha = 0},
                       completion: {(bool: Bool) in self.isHidden = true})
    }
    
    func unhideBySettingAlphaToOne() {
        self.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 1
        })
    }
    
    func drawTarget(withRect rect: CGRect, withTickness tickness: CGFloat, withColor color: CGColor) -> UIImageView {
        let lineLength: CGFloat = 29.0
        let outerMargin: CGFloat = tickness / 2
        
        //let totalLength = scanSquareSideLength + spaceBetweenLineAndScanSquare * 2 + lineWidth * 2 + outerMargin * 2
        let totalSize = CGSize(width: rect.width + tickness * 2  + outerMargin * 2, height: rect.height + tickness * 2  + outerMargin * 2)
        
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: rect.origin.x, y: rect.origin.y), size: totalSize))
        
        // Setup context
        let boundsWithoutMargin = CGRect(origin: CGPoint(x: outerMargin, y: outerMargin), size: CGSize(width: totalSize.width - outerMargin * 2, height: totalSize.height - outerMargin * 2))
        let opaque = false
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(totalSize, opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        
        // Setup completed, start drawing
        context!.setStrokeColor(color)
        context!.setLineWidth(tickness)
        context!.setLineJoin(.round)
        
        // .            (1)                      (2)
        // .         __________               __________
        // .        |                                   |
        // .    (8) |                                   | (3)
        // .        |                                   |
        // .        |                                   |
        // .
        // .
        // .
        // .
        // .
        // .
        // .        |                                   |
        // .    (7) |                                   | (4)
        // .        |                                   |
        // .        |__________               __________|
        // .           (6)                       (5)
        
        context!.beginPath()
        
        // Draw (8) and (1)
        context!.move(to: CGPoint(x: boundsWithoutMargin.minX, y: boundsWithoutMargin.minY + lineLength))
        context!.addLine(to: CGPoint(x: boundsWithoutMargin.minX, y: boundsWithoutMargin.minY))
        context!.addLine(to: CGPoint(x: boundsWithoutMargin.minX + lineLength, y: boundsWithoutMargin.minY))
        
        // Draw (2) and (3)
        context!.move(to: CGPoint(x: boundsWithoutMargin.maxX - lineLength, y: boundsWithoutMargin.minY))
        context!.addLine(to: CGPoint(x: boundsWithoutMargin.maxX, y: boundsWithoutMargin.minY))
        context!.addLine(to: CGPoint(x: boundsWithoutMargin.maxX, y: boundsWithoutMargin.minY + lineLength))
        
        // Draw (4) and (5)
        context!.move(to: CGPoint(x: boundsWithoutMargin.maxX, y: boundsWithoutMargin.maxY - lineLength))
        context!.addLine(to: CGPoint(x: boundsWithoutMargin.maxX, y: boundsWithoutMargin.maxY))
        context!.addLine(to: CGPoint(x: boundsWithoutMargin.maxX - lineLength, y: boundsWithoutMargin.maxY))
        
        // Draw (6) and (7)
        context!.move(to: CGPoint(x: boundsWithoutMargin.minX + lineLength, y: boundsWithoutMargin.maxY))
        context!.addLine(to: CGPoint(x: boundsWithoutMargin.minX, y: boundsWithoutMargin.maxY))
        context!.addLine(to: CGPoint(x: boundsWithoutMargin.minX, y: boundsWithoutMargin.maxY - lineLength))
        
        context!.drawPath(using: .stroke)
        
        // Drawing completed, retrieve the finished image and cleanup
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageView.image = image
        self.addSubview(imageView)
        return imageView
    }
}

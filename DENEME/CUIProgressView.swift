//
//  CUIProgressBarView.swift
//  MobileBanking
//
//  Created by Caner Aksakal on 4.10.2016.
//  Copyright © 2016 Ykb. All rights reserved.
//

//  CUITextStyle.swift
//  DENEME
//  Changed by Melis Gülenay
//


import UIKit

@IBDesignable class CUIProgressBarView: CUIView {
    
    fileprivate var leftView: UIView!
    fileprivate var rightView: UIView!
    fileprivate var leftLabel: CUILabel!
    fileprivate var rightLabel: CUILabel!
    fileprivate var progressConstraint: NSLayoutConstraint!
    
    @IBInspectable var styleNo: Int = 0 {
        didSet {
    //        applyStyle(theme.getProgressBarViewStyleFromStyleNo(styleNo))
        }
    }
    
    @IBInspectable var progress: CGFloat = 0.0 {
        didSet {
            progressConstraint = leftView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: progress)
            progressConstraint.isActive = true
        }
    }
    
    @IBInspectable var leftText: String? {
        didSet {
            leftLabel.text = leftText
        }
    }
    
    @IBInspectable var rightText: String? {
        didSet {
            rightLabel.text = rightText
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    fileprivate func prepare() {
        
        leftView = UIView()
        leftView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftView)
        
        rightView = UIView()
        rightView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightView)
        
        leftView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        leftView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        leftView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        leftView.rightAnchor.constraint(equalTo: rightView.leftAnchor).isActive = true
        rightView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        rightView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rightView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        leftLabel = CUILabel()
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftLabel)
        
        rightLabel = CUILabel()
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightLabel)
        
        leftLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        leftLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        rightLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rightLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
    //    self.setContentHuggingPriority(.Required, for: .horizontal)
        
     //   applyStyle(theme.getProgressBarViewStyleFromStyleNo(styleNo))
    }
    
    func applyStyle(_ style: CUIProgressBarViewStyle) {
        leftView.backgroundColor = style.leftBackgroundColor
        rightView.backgroundColor = style.rightBackgroundColor
        leftLabel.applyStyle(style.textStyle)
        rightLabel.applyStyle(style.textStyle)
    }
    
    override var intrinsicContentSize : CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 20)
    }
}

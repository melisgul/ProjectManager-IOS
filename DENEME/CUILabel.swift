
//
//  CUILabel.swift
//  CustomUI
//
//  Created by Caner Aksakal on 16/07/15. Changed by Melis Gülenay 26/07/17
//  Copyright (c) 2015 Caner Aksakal. All rights reserved.
//

import UIKit

@IBDesignable
open class CUILabel: UILabel {
    //, ThemeAccessor
    @IBInspectable var loremIpsum: String?
    
    @IBInspectable open var textStyleNo: Int = 0 {
        didSet {
          //  applyStyle(getCurrentTheme().getTextStyleFromStyleNo(textStyleNo))
        }
    }
    
    var textStyle: CUITextStyle!
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       // applyStyle(getCurrentTheme().getTextStyleFromStyleNo(textStyleNo))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      // applyStyle(getCurrentTheme().getTextStyleFromStyleNo(textStyleNo))
    }
    
    init(style: CUITextStyle){
        super.init(frame: CGRect.zero)
        applyStyle(style)
    }
    
    func applyStyle(_ style: CUITextStyle) {
        textStyle = style
        super.font = style.font
        super.textColor = style.textColor
    }
    
    open override var font: UIFont! {
        get { return super.font }
        set {}
    }
    
    open override var textColor: UIColor! {
        get { return super.textColor }
        set {}
    }
    
    override  open func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        if text == nil || text!.isEmpty {
            text = loremIpsum
        } else {
        }
        
        updateConstraintsIfNeeded()
    }
}

//
//  CUIButton.swift
//  DENEME
//
//  Created by Admin on 23/07/2017.
//  Copyright © 2017 Melis. All rights reserved.
//

import UIKit

@IBDesignable class CUIButton: UIButton{
    
    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }

    
    
    
    
  
}

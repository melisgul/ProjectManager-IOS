//
//  CUIProgressBarViewStyle.swift
//  MobileBanking
//
//  Created by Caner Aksakal on 4.10.2016.
//  Copyright © 2016 Ykb. All rights reserved.
//  Changed by Melis Gülenay 26/07/17

import UIKit

struct CUIProgressBarViewStyle {
    var leftBackgroundColor: UIColor
    var rightBackgroundColor: UIColor
    var textStyle: CUITextStyle
    
    init(leftBackgroundColor: UIColor, rightBackgroundColor: UIColor, textStyle: CUITextStyle) {
        self.leftBackgroundColor = leftBackgroundColor
        self.rightBackgroundColor = rightBackgroundColor
        self.textStyle = textStyle
    }
}

protocol CUIProgressBarViewStyler {
    
    var progressBarViewStyle0: CUIProgressBarViewStyle { get set }
    
}

extension CUIProgressBarViewStyler {
    func getProgressBarViewStyleFromStyleNo(_ styleNo: Int) -> CUIProgressBarViewStyle {
        switch styleNo {
        case 0:
            return progressBarViewStyle0
        default:
            return progressBarViewStyle0
        }
    }
}

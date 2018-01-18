

//
//  CUITextStyle.swift
//  MobileBanking
//
//  Created by Kemal Çerik on 28/12/15.
//  Copyright © 2015 Ykb. All rights reserved.
//

//
//  CUITextStyle.swift
//  DENEME
//
//
//  Changed by © 2017 Melis Gülenay


import Foundation
import UIKit

struct CUITextStyle {
    var font: UIFont
    var textColor: UIColor
    
    init(font: UIFont, textColor: UIColor){
        self.font = font
        self.textColor = textColor
    }
}

protocol CUITextStyler {
    var textStyle1: CUITextStyle {get set}
    var textStyle2: CUITextStyle {get set}
    var textStyle3: CUITextStyle {get set}
    var textStyle4: CUITextStyle {get set}
    var textStyle6: CUITextStyle {get set}
    var textStyle7: CUITextStyle {get set}
    var textStyle8: CUITextStyle {get set}
    var textStyle9: CUITextStyle {get set}
    
    ///CUITabControl titleText
    var textStyle10: CUITextStyle {get set}
    
    ///CUITabControl selectedTitleText - CUIInputView modal label
    var textStyle11: CUITextStyle {get set}
    
    ///CUILinkButton text
    var textStyle12: CUITextStyle {get set}
    
    var textStyle13: CUITextStyle {get set}
    var textStyle14: CUITextStyle {get set}
    var textStyle15: CUITextStyle {get set}
    var textStyle16: CUITextStyle {get set}
    
    ///sCUIMultiLineTextInput remaining character count label
    var textStyle17: CUITextStyle {get set}
    
    ///account open / currency code
    var textStyle18: CUITextStyle {get set}
    
    ///payment method > account name / card number
    var textStyle19: CUITextStyle {get set}
    
    ///product not found
    var textStyle20: CUITextStyle {get set}
    
    ///alert view controller title text
    var textStyle21: CUITextStyle {get set}
    
    ///full page modal title
    var textStyle22: CUITextStyle {get set}
    
    ///information text
    var textStyle24: CUITextStyle {get set}
    
    var textStyle25: CUITextStyle {get set}
    var textStyle26: CUITextStyle {get set}
    
    ///agreement modal title text
    var textStyle27: CUITextStyle {get set}
    
    ///end page message text
    var textStyle28: CUITextStyle {get set}
    var textStyle29: CUITextStyle {get set}
    var textStyle30: CUITextStyle {get set}
    var textStyle31: CUITextStyle {get set}
    var textStyle32: CUITextStyle {get set}
    
    ///login icon text style
    var textStyle34: CUITextStyle {get set}
    
    var textStyle35: CUITextStyle {get set}
    
    ///validation view text
    var textStyle36: CUITextStyle {get set}
    
    ///agreement input link text style
    var textStyle37: CUITextStyle {get set}
    
    ///left menu item text
    var textStyle38: CUITextStyle {get set}
    
    ///left menu name surname
    var textStyle39: CUITextStyle {get set}
    
    ///navigation item title
    var textStyle40: CUITextStyle {get set}
    
    ///submenu item
    var textStyle41: CUITextStyle {get set}
    
    ///submenu group header
    var textStyle42: CUITextStyle {get set}
    
    ///context menu dynamic item
    var textStyle43: CUITextStyle {get set}
    
    ///the more subtitle
    var textStyle44: CUITextStyle {get set}
    
    ///credits red label
    var textStyle45: CUITextStyle {get set}
    
    ///bigger credits
    var textStyle46: CUITextStyle {get set}
    
    ///nearestykb
    var textStyle47: CUITextStyle {get set}
    
    ///nonsecure funds
    var textStyle48: CUITextStyle {get set}
    
    ///OTP last success/unsuccess login dates
    var textStyle49: CUITextStyle {get set}
    ///OTP last success/unsuccess login times
    var textStyle50: CUITextStyle {get set}
    ///OTP first label
    var textStyle51: CUITextStyle {get set}
    ///OTP remaining second value
    var textStyle52: CUITextStyle {get set}
    ///OTP remaining second label
    var textStyle53: CUITextStyle {get set}
    ///OTP welcome message
    var textStyle54: CUITextStyle {get set}
    ///OTP last success/unsuccess login dates label
    var textStyle55: CUITextStyle {get set}
    
    ///campaign detail title
    var textStyle56: CUITextStyle {get set}
    
    ///Content search invoice company other info
    var textStyle57: CUITextStyle {get set}
    ///Content search smart guide other info
    var textStyle58: CUITextStyle {get set}
    ///Content search smart guide section header
    var textStyle59: CUITextStyle {get set}
    ///Content search invoice company name / smart guide receiver name
    var textStyle60: CUITextStyle {get set}
    
    // Üç Nokta Menü
    var textStyle61: CUITextStyle {get set}
    var textStyle62: CUITextStyle {get set}
    
    ///soft otp label
    var textStyle65: CUITextStyle {get set}
    
    //Hesap listeleme özel stiller
    var textStyle66: CUITextStyle {get set}
    var textStyle67: CUITextStyle {get set}
    var textStyle68: CUITextStyle {get set}
    var textStyle69: CUITextStyle {get set}
    var textStyle70: CUITextStyle {get set}
    var textStyle71: CUITextStyle {get set}
    var textStyle72: CUITextStyle {get set}
    
    var textStyle73: CUITextStyle {get set}
    
    /// About Screen
    var textStyle76: CUITextStyle {get set}
    var textStyle77: CUITextStyle {get set}
    
    //Provision label
    var textStyle74: CUITextStyle {get set}
    
    //Due Date Warning message
    var textStyle75: CUITextStyle {get set}
    var textStyle79: CUITextStyle {get set}
    
    ///standart display view value text style (should not be used elsewhere)
    var textStyle80: CUITextStyle {get set}
    
    // Slider text style
    var textStyle83: CUITextStyle {get set}
    
    //Iban hesaplar için
    var textStyle84: CUITextStyle {get set}
    
    // Paid status text style
    var textStyle85: CUITextStyle {get set}
    
    //content search group header
    var textStyle86: CUITextStyle {get set}
    
    //QR Code Button Styles
    var textStyle87: CUITextStyle {get set}
    var textStyle88: CUITextStyle {get set}
    
    //dashboard widget amount
    var textStyle91: CUITextStyle {get set}
    
    //dashboard table amount
    var textStyle92: CUITextStyle {get set}
    
    //submenu group header text
    var textStyle93: CUITextStyle {get set}
    
    //Fatura ödeme metro cell
    var textStyle95: CUITextStyle {get set}
    
    //campaign notification
    var textStyle96: CUITextStyle {get set}
    var textStyle97: CUITextStyle {get set}
    
    //provision amount
    var textStyle98: CUITextStyle {get set}
    
    //New information display font
    var textStyle103: CUITextStyle {get set}
    var textStyle104: CUITextStyle {get set}
    var textStyle105: CUITextStyle {get set}
    
    //Smart Guide Button
    var textStyle106: CUITextStyle {get set}
    
    var textStyle107: CUITextStyle {get set}
    
    var textStyle108: CUITextStyle {get set}
    
    var textStyle109: CUITextStyle {get set}
    
    var textStyle110: CUITextStyle {get set}
    
    var textStyle111: CUITextStyle {get set}
    
    // partial debt warning message
    var textStyle112: CUITextStyle {get set}
    
    /// EyeVerify Countdown Label Style
    var textStyle113: CUITextStyle {get set}
    
    var textStyle114: CUITextStyle {get set}
    
    // QMatic Ticket Styles
    var textStyle115: CUITextStyle {get set}
    var textStyle116: CUITextStyle {get set}
    var textStyle117: CUITextStyle {get set}
    
    // Branch Density Styles
    var textStyle118: CUITextStyle {get set}
    var textStyle119: CUITextStyle {get set}
    var textStyle120: CUITextStyle {get set}
    var textStyle121: CUITextStyle {get set}
    
    var textStyle122: CUITextStyle {get set}
    
    var textStyle123: CUITextStyle {get set}
    var textStyle124: CUITextStyle {get set}
    var textStyle125: CUITextStyle {get set}
    var textStyle126: CUITextStyle {get set}
    var textStyle127: CUITextStyle {get set}
    var textStyle128: CUITextStyle {get set}
    
    // android için sona eklenen stylelar
    var textStyle208: CUITextStyle {get set}
    var textStyle209: CUITextStyle {get set}
    var textStyle210: CUITextStyle {get set}
    var textStyle211: CUITextStyle {get set}
    var textStyle212: CUITextStyle {get set}
    var textStyle213: CUITextStyle {get set}
    var textStyle214: CUITextStyle {get set}
    var textStyle215: CUITextStyle {get set}
    var textStyle216: CUITextStyle {get set}
    var textStyle217: CUITextStyle {get set}
    var textStyle218: CUITextStyle {get set}
    var textStyle219: CUITextStyle {get set}
    var textStyle220: CUITextStyle {get set}
    
    // Dashboard Pie Chart
    var textStyle221: CUITextStyle {get set}
    var textStyle222: CUITextStyle {get set}
    var textStyle223: CUITextStyle {get set}
    var textStyle224: CUITextStyle {get set}
    
    var textStyle225: CUITextStyle {get set}
    var textStyle226: CUITextStyle {get set}
    var textStyle227: CUITextStyle {get set}
    var textStyle228: CUITextStyle {get set}
    
}

extension CUITextStyler {
    func getTextStyleFromStyleNo(_ styleNo: Int) -> CUITextStyle {
        switch styleNo{
        case 1:
            return textStyle1
        case 2:
            return textStyle2
        case 3:
            return textStyle3
        case 4:
            return textStyle4
        case 6:
            return textStyle6
        case 7:
            return textStyle7
        case 8:
            return textStyle8
        case 9:
            return textStyle9
        case 10:
            return textStyle10
        case 11:
            return textStyle11
        case 12:
            return textStyle12
        case 13:
            return textStyle13
        case 14:
            return textStyle14
        case 15:
            return textStyle15
        case 16:
            return textStyle16
        case 17:
            return textStyle17
        case 18:
            return textStyle18
        case 19:
            return textStyle19
        case 20:
            return textStyle20
        case 21:
            return textStyle21
        case 22:
            return textStyle22
        case 24:
            return textStyle24
        case 25:
            return textStyle25
        case 26:
            return textStyle26
        case 27:
            return textStyle27
        case 28:
            return textStyle28
        case 29:
            return textStyle29
        case 30:
            return textStyle30
        case 31:
            return textStyle31
        case 32:
            return textStyle32
        case 34:
            return textStyle34
        case 35:
            return textStyle35
        case 36:
            return textStyle36
        case 37:
            return textStyle37
        case 38:
            return textStyle38
        case 39:
            return textStyle39
        case 40:
            return textStyle40
        case 41:
            return textStyle41
        case 42:
            return textStyle42
        case 43:
            return textStyle43
        case 44:
            return textStyle44
        case 45:
            return textStyle45
        case 46:
            return textStyle46
        case 47:
            return textStyle47
        case 48:
            return textStyle48
        case 49:
            return textStyle49
        case 50:
            return textStyle50
        case 51:
            return textStyle51
        case 52:
            return textStyle52
        case 53:
            return textStyle53
        case 54:
            return textStyle54
        case 55:
            return textStyle55
        case 56:
            return textStyle56
        case 57:
            return textStyle57
        case 58:
            return textStyle58
        case 59:
            return textStyle59
        case 60:
            return textStyle60
        case 61:
            return textStyle61
        case 62:
            return textStyle62
        case 65:
            return textStyle65
        case 66:
            return textStyle66
        case 67:
            return textStyle67
        case 68:
            return textStyle68
        case 69:
            return textStyle69
        case 70:
            return textStyle70
        case 71:
            return textStyle71
        case 72:
            return textStyle72
        case 73:
            return textStyle73
        case 74:
            return textStyle74
        case 75:
            return textStyle75
        case 76:
            return textStyle76
        case 77:
            return textStyle77
        case 79:
            return textStyle79
        case 80:
            return textStyle80
        case 83:
            return textStyle83
        case 84:
            return textStyle84
        case 85:
            return textStyle85
        case 86:
            return textStyle86
        case 87:
            return textStyle87
        case 88:
            return textStyle88
        case 91:
            return textStyle91
        case 92:
            return textStyle92
        case 93:
            return textStyle93
        case 95:
            return textStyle95
        case 96:
            return textStyle96
        case 97:
            return textStyle97
        case 98:
            return textStyle98
        case 103:
            return textStyle103
        case 104:
            return textStyle104
        case 105:
            return textStyle105
        case 106:
            return textStyle106
        case 107:
            return textStyle107
        case 108:
            return textStyle108
        case 109:
            return textStyle109
        case 110:
            return textStyle110
        case 111:
            return textStyle111
        case 112:
            return textStyle112
        case 113:
            return textStyle113
        case 114:
            return textStyle114
        case 115:
            return textStyle115
        case 116:
            return textStyle116
        case 117:
            return textStyle117
        case 118:
            return textStyle118
        case 119:
            return textStyle119
        case 120:
            return textStyle120
        case 121:
            return textStyle121
        case 122:
            return textStyle122
        case 123:
            return textStyle123
        case 124:
            return textStyle124
        case 125:
            return textStyle125
        case 126:
            return textStyle126
        case 127:
            return textStyle127
        case 128:
            return textStyle128
        case 208:
            return textStyle208
        case 209:
            return textStyle209
        case 210:
            return textStyle210
        case 211:
            return textStyle211
        case 212:
            return textStyle212
        case 213:
            return textStyle213
        case 214:
            return textStyle214
        case 215:
            return textStyle215
        case 216:
            return textStyle216
        case 217:
            return textStyle217
        case 218:
            return textStyle218
        case 219:
            return textStyle219
        case 220:
            return textStyle220
        case 221:
            return textStyle221
        case 222:
            return textStyle222
        case 223:
            return textStyle223
        case 224:
            return textStyle224
        case 225:
            return textStyle225
        case 226:
            return textStyle226
        case 227:
            return textStyle227
        case 228:
            return textStyle228
        default:
            return textStyle1
        }
    }
}

//
//  String+Ext.swift
//  ShoppingApp
//
//  Created by Thanh Hoang on 29/06/2022.
//

import UIKit

extension String {
    
    func estimatedString(width: CGFloat = CGFloat.greatestFiniteMagnitude, font: UIFont) -> CGRect {
        let size = CGSize(width: width, height: .greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let attr: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        
        return NSString(string: self).boundingRect(with: size, options: options, attributes: attr, context: nil)
    }
}

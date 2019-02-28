//
//  TagViewStyle.swift
//  TagField
//
//  Created by chutatsu on 2019/02/24.
//  Copyright © 2019 churabou. All rights reserved.
//

import UIKit



public typealias Margin = CGPoint
public typealias Padding = UIEdgeInsets

public struct Style {
    public var padding = Padding(top: 3, left: 6, bottom: 3, right: 6)
    public var textColor: UIColor = .white
    public var tintColor: UIColor = .hex(hexStr: "#9e93ff")
    public var backgroundColor: UIColor = .hex(hexStr: "#9e93ff")
    public var borderColor: UIColor = .hex(hexStr: "#8e83ef")
    public var borderWidth: CGFloat = 3
    public var font: UIFont = .boldSystemFont(ofSize: 17)
    public var cornerRadius: CGFloat = 2
    public var margin = CGPoint(x: 8, y: 4)
    public var showDeleteButton: Bool = true
    
    var onSelected: (Bool, TagView) -> Swift.Void = { isSelected, tagView in
        guard isSelected else { return }
        UIView.animate(withDuration: 0.2, animations: {
            tagView.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                tagView.transform = .identity
            }
        }
    }
    
    public mutating func makeCircle() {
        let height = "".size(withAttributes: [.font: font]).height + padding.bottom + padding.top
        cornerRadius = height / 2
    }
}

extension UIColor {
    
    class func hex(hexStr: String) -> UIColor{
        let scanner = Scanner(string: hexStr.replacingOccurrences(of: "#", with: ""))
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let red = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1)
        } else {
            return .black
        }
    }
}

extension Style {
    
    static var wontedly: Style {
        var style = Style()
        style.borderColor = UIColor.hex(hexStr: "#19ebff")
        style.borderWidth = 2
        style.textColor = UIColor.hex(hexStr: "#19ebff")
        style.backgroundColor = .white
        style.cornerRadius = NSString(string: "").size(withAttributes: [.font: style.font]).height / 2
        return style
    }
    
    static var green: Style {
        var style = Style()
        style.backgroundColor = .hex(hexStr: "#19d639")
        style.textColor = .white
        style.cornerRadius = 3
        style.padding = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        return style
    }
    
    static var pink: Style {
        var style = Style()
        style.textColor = .white
        style.backgroundColor = UIColor.hex(hexStr: " #ff99c8")
        style.cornerRadius = 3
        return style
    }
    
    static var murasaki: Style {
        var style = Style()
        style.backgroundColor = .hex(hexStr: "#9e93ff")
        style.textColor = .white
        style.padding = Padding(top: 2, left: 8, bottom: 2, right: 8)
        style.cornerRadius = (NSString(string: "").size(withAttributes: [.font: style.font]).height/2) + style.padding.top
        return style
    }
}

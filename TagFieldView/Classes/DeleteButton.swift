//
//  DeleteButton.swift
//  TagField
//
//  Created by chutatsu on 2019/02/26.
//  Copyright © 2019 churabou. All rights reserved.
//

import UIKit


public struct DeleteButtonStyle {
    public var backgroundColor: UIColor = .darkGray
    public var lineColor: UIColor = .white
    public var isCircle: Bool = true
    public var size: CGFloat = 17
    public var iconSize: CGFloat = 10
    public var lineWidth: CGFloat = 1
}

public final class DeleteButton: UIButton {
    
    private (set) var style = DeleteButtonStyle()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = style.backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)

        let path = UIBezierPath()
        path.lineWidth = style.lineWidth
        path.lineCapStyle = .round
        let iconFrame = CGRect(
            x: (rect.width - style.iconSize) / 2.0,
            y: (rect.height - style.iconSize) / 2.0,
            width: style.iconSize,
            height: style.iconSize
        )
        path.move(to: iconFrame.origin)
        path.addLine(to: CGPoint(x: iconFrame.maxX, y: iconFrame.maxY))
        path.move(to: CGPoint(x: iconFrame.maxX, y: iconFrame.minY))
        path.addLine(to: CGPoint(x: iconFrame.minX, y: iconFrame.maxY))
        style.lineColor.setStroke()
        path.stroke()
        
        if style.isCircle {
            layer.cornerRadius = bounds.height / 2
            clipsToBounds = true
        }
    }
}

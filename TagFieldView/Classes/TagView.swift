//
//  TagView.swift
//  TagField
//
//  Created by chutatsu on 2019/02/24.
//  Copyright © 2019 churabou. All rights reserved.
//

import UIKit

final class TagView: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(name: String, style: Style) {
        super.init(frame: .zero)
        self.style = style
        self.text = name
        initializeView()
    }
    
    private var style: Style!

    private func initializeView() {
        textColor = style.textColor
        font = style.font
        layer.cornerRadius = style.cornerRadius
        layer.borderColor = style.borderColor.cgColor
        layer.borderWidth = style.borderWidth
        backgroundColor = style.backgroundColor
        clipsToBounds = true
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGesture)
        addSubview(deleteButton)
        deleteButton.isHidden = !style.showDeleteButton
    }
    
    private lazy var deleteButton: DeleteButton = {
        let b = DeleteButton()
        b.addTarget(self, action: #selector(actionDelete), for: .touchUpInside)
        return b
    }()
    
    
    var isSelected = false {
        didSet {
            style.onSelected(isSelected, self)
        }
    }
    
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionTap))
    
    @objc private func actionTap() {
        print(frame)
        print(deleteButton.frame)
        print(frame.contains(deleteButton.frame))
        onSelectTag?(self)
    }
    
    @objc private func actionDelete() {
        onTapDelete?(self)
    }
    
    var onSelectTag: ((TagView) -> Swift.Void)?
    var onTapDelete: ((TagView) -> Swift.Void)?
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: style.padding))
    }
    
    func fitSize() -> CGSize {
        var size = intrinsicContentSize
        //        var size = text?.size(withAttributes: [.font: self.font]) ?? .zero
        size.height += style.padding.top + style.padding.bottom
        size.width += style.padding.left + style.padding.right
        
        if style.showDeleteButton {
            size.width += deleteButton.style.size + style.padding.right
        }
        return size
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        deleteButton.frame = CGRect(x: bounds.width-deleteButton.style.size-style.padding.right,
                                    y: (bounds.height-deleteButton.style.size) / 2,
                                    width: deleteButton.style.size,
                                    height: deleteButton.style.size)
    }
}

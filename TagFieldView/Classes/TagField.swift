//
//  TagField.swift
//  TagField
//
//  Created by chutatsu on 2019/02/24.
//  Copyright © 2019 churabou. All rights reserved.
//

import UIKit


public class BackspaceDetectableTextField: UITextField {
    
    var onDeleteBackwards: (() -> Void)?
    
    override public func deleteBackward() {
        onDeleteBackwards?()
        super.deleteBackward()
    }
}


public final class TagField: TagListView {
    
    var placeholderColor: UIColor = .darkGray
    var placeholderText = "tags"
    
    func attributedPlaceholder() -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: placeholderColor]
        return NSAttributedString(string: placeholderText, attributes: attributes)
    }

    public var style = Style()
    
    public lazy var textField: BackspaceDetectableTextField =  {
        let t = BackspaceDetectableTextField()
        t.backgroundColor = .clear
        t.autocorrectionType = .no
        t.autocapitalizationType = .none
        t.spellCheckingType = .no
        t.delegate = self
        t.backgroundColor = UIColor.orange.withAlphaComponent(0.1)
        t.attributedPlaceholder = attributedPlaceholder()
        return t
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textField)
        delegate = self
        
        textField.onDeleteBackwards = { [weak self] in
            self?.deleteBackward()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func repositionView() {
        super.repositionView()
        
        let height: CGFloat = ("" as NSString).size(withAttributes: [.font: style.font]).height + (style.padding.top+style.padding.bottom)
        
        if let last = tagViews.last {
            let minmumTextFieldWidth: CGFloat = 80
            if bounds.width - last.frame.maxX - style.margin.x < minmumTextFieldWidth {
                textField.frame.origin.x = style.margin.x
                textField.frame.origin.y = last.frame.maxY + style.margin.y // yだけ
                // 初期値
                textField.frame.size = CGSize(width: bounds.width-2*style.margin.x, height: height)
            } else {
                textField.frame.origin = CGPoint(x: last.frame.maxX+style.margin.x, y: last.frame.minY)
                textField.frame.size = CGSize(width: (bounds.width - last.frame.maxX), height: last.frame.height)
            }
        } else {
            // 初期値
            textField.frame.origin = CGPoint(x: style.margin.x, y: style.margin.y)
            textField.frame.size = CGSize(width: bounds.width-2*style.margin.x, height: height)
        }
    }
}

extension TagField: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        tagViews.forEach { $0.isSelected = false }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            addTag(text, style: style)
            textField.text = ""
        }
        return true
    }
    
    func deleteBackward() {
        // delete tag
        if let selected = tagViews.first(where: { $0.isSelected }) {
            remove(selected)
            return
        }
        // select last tag
        if (textField.text ?? "").isEmpty, let tagView = tagViews.last {
            tagViews.forEach { $0.isSelected = $0 === tagView }
        }
    }
}


extension TagField: TagListViewDelegate {
    
    func didTapTag(_ tagView: TagView) {
        tagViews.forEach { $0.isSelected = $0 === tagView}
    }
}

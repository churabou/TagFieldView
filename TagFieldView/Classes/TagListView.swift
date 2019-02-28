//
//  TagListView.swift
//  TagField
//
//  Created by chutatsu on 2019/02/25.
//  Copyright © 2019 churabou. All rights reserved.
//

import UIKit

protocol TagListViewDelegate: class {
    func didTapTag(_ tagView: TagView)
}

public class TagListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: TagListViewDelegate?
    
    private var style = Style()

    private (set) var contentView: UIScrollView = {
        let s = UIScrollView()
        s.isScrollEnabled = true
        s.showsHorizontalScrollIndicator = false
        return s
    }()
    
    private func initializeView() {
        addSubview(contentView)
    }
    
    private (set) var tagViews: [TagView] = [] {
        didSet {
            repositionView()
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
        repositionView()
    }

    func repositionView() {

        var currentX: CGFloat = style.margin.x
        var currentY: CGFloat = style.margin.y

        tagViews.enumerated().forEach { index, tagView in
            let size = tagView.fitSize()
            let width = min(size.width, bounds.width - 2 * style.margin.x)
            if currentX + width > bounds.width {
                currentX = style.margin.x
                currentY += size.height + style.margin.y
            }
            tagView.frame.origin = CGPoint(x: currentX, y: currentY)
            tagView.frame.size = CGSize(width: width, height: size.height)
            currentX += width + style.margin.x
            
            if let last = tagViews.last {
                // 一定サイズになったらスクロールさせる。
                contentView.contentSize = CGSize(width: bounds.width, height: last.frame.maxY + style.margin.y)
                if last.frame.maxY > bounds.maxY {
                    contentView.isScrollEnabled = true
                }
            }
        }
    }
}

extension TagListView {
    
    func addTag(_ text: String, style: Style = Style()) {
        let tagView = TagView(name: text, style: style)
        tagView.onSelectTag = { [weak self] tagView in
            self?.delegate?.didTapTag(tagView)
        }
        tagView.onTapDelete = { [weak self] tagView in
            self?.remove(tagView)
        }
        contentView.addSubview(tagView)
        tagViews.append(tagView)
    }
    
    func remove(_ tagView: TagView) {
        tagView.removeFromSuperview()
        tagViews.remove(at: tagViews.firstIndex(of: tagView)!)
    }
}


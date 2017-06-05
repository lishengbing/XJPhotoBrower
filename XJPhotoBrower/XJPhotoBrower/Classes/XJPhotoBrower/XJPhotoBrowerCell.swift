//
//  XJPhotoBrowerCell.swift
//  XJPhotoBrower
//
//  Created by shanlin on 2017/6/3.
//  Copyright © 2017年 shanlin. All rights reserved.
//

import UIKit

protocol XJPhotoBrowerCellDelegate: class {
    func cellWithTapGestureImageView(_ photoBrowerCell: XJPhotoBrowerCell)
    func cellWithLongGestureImageView(_ photoBrowerCell: XJPhotoBrowerCell)
}

class XJPhotoBrowerCell: UICollectionViewCell {
    
    weak var delegate: XJPhotoBrowerCellDelegate?
    lazy var scrollView: UIScrollView = UIScrollView()
    lazy var imgView: UIImageView = UIImageView()
    var isScaleBig: Bool = false
    
    var photoBrowerImage: UIImage? {
        didSet {
            setupContent(image: photoBrowerImage)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension XJPhotoBrowerCell {
    fileprivate func setupUI() {
        addSubview(scrollView)
        scrollView.addSubview(imgView)
        
        scrollView.frame = contentView.bounds
        scrollView.frame.size.width -= 20
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 3
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGes(sender:)))
        scrollView.addGestureRecognizer(tap)
        
        let long = UILongPressGestureRecognizer(target: self, action: #selector(longGes(sender:)))
        scrollView.addGestureRecognizer(long)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap(sender:)))
        doubleTap.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTap)
        tap.require(toFail: doubleTap)
    }
}

extension XJPhotoBrowerCell: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let imgaeV = scrollView.subviews.first as! UIImageView
        let offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width) ? (scrollView.bounds.width - scrollView.contentSize.width) * 0.5 : 0
        let offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height) ? (scrollView.bounds.height - scrollView.contentSize.height) * 0.5 : 0
        imgaeV.center = CGPoint(x: offsetX + scrollView.contentSize.width * 0.5, y: offsetY + scrollView.contentSize.height * 0.5)
    }
}

extension XJPhotoBrowerCell {
    @objc fileprivate func tapGes(sender: UITapGestureRecognizer) {
        delegate?.cellWithTapGestureImageView(self)
    }
    
    @objc fileprivate func longGes(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.began {
            delegate?.cellWithLongGestureImageView(self)
        }
    }
    
    @objc fileprivate func doubleTap(sender: UITapGestureRecognizer) {
        let scrolV = sender.view as! UIScrollView
        var scale = scrollView.zoomScale
        if isScaleBig {
            scale = 1
            scrolV.setZoomScale(scale , animated: true)
            isScaleBig = false
        }else {
            scrolV.setZoomScale(scale * 2, animated: true)
            isScaleBig = true
        }
    }
}

extension XJPhotoBrowerCell {
    fileprivate func setupContent(image: UIImage?) {
        /** 1: cell.scrollView.setZoomScale(1.0, animated: false)
         *  2: 这个方法如果要设置一定要在计算frame之前设置，不然没有效果
         */
        guard let image = image else { return }
        let image_x: CGFloat = 0
        let image_width: CGFloat = UIScreen.main.bounds.width
        let image_height: CGFloat = image_width / image.size.width * image.size.height
        
        var image_y: CGFloat = 0
        if image_height > UIScreen.main.bounds.height {
            image_y = 0
        }else {
            image_y = (UIScreen.main.bounds.height - image_height) * 0.5
        }
        
        imgView.frame = CGRect(x: image_x, y: image_y, width: image_width, height: image_height)
        imgView.image = image
        scrollView.contentSize = CGSize(width: 0, height: image_height)
    }
}




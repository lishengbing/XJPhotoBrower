//
//  XJPhotoBrowerAnimator.swift
//  XJ
//
//  Created by 李胜兵 on 2016/11/29.
//  Copyright © 2016年 李胜兵. All rights reserved.
//  面向协议开发(面向接口开发) ->

import UIKit


// 面向协议开发
protocol AnimatorPresentedDelegate : NSObjectProtocol {
    func starRect(indexPath : IndexPath) -> CGRect
    func endRect(indexPath : IndexPath) -> CGRect
    func imageView(indexPath : IndexPath) -> UIImageView
}

protocol AnimatorDismissDelegate : NSObjectProtocol {
    func indexPathForDismissView() -> IndexPath
    func imageViewForDismissView() -> UIImageView
}

class XJPhotoBrowerAnimator: NSObject {
    fileprivate var isPresented : Bool = false
    var indexPath : IndexPath?
    
    // 代理属性
    var presentedDelegate : AnimatorPresentedDelegate?
    var dismissDelegate : AnimatorDismissDelegate?
}

// MARK: - 遵守代理
extension XJPhotoBrowerAnimator : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        return self
    }
}


extension XJPhotoBrowerAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresented ? animationForPresented(transitionContext: transitionContext) : animtionForDismiss(transitionContext: transitionContext)
    }
    
    
    // 弹出动画
    fileprivate func animationForPresented(transitionContext: UIViewControllerContextTransitioning) {
        // nil值校验
        guard let presentedDelegate = presentedDelegate, let indexPath = indexPath else {
            return
        }
        
        // 1: 取出弹出的view UITransitionContextFromViewKey, and UITransitionContextToViewKey
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        // 2:将presentedView弹出view加到containerView中
        transitionContext.containerView.addSubview(presentedView)
        
        // 3: 获取执行动画的imageView
        let starRect = presentedDelegate.starRect(indexPath: indexPath)
        let imageView = presentedDelegate.imageView(indexPath: indexPath)
        transitionContext.containerView.addSubview(imageView)
        imageView.frame = starRect
        
        
        // 3:执行动画:最后一步，一定要告诉上下文已经完成了动画
        presentedView.alpha = 0.0
        transitionContext.containerView.backgroundColor = UIColor.black
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            imageView.frame = presentedDelegate.endRect(indexPath: indexPath)
        }, completion: { (_) in
            transitionContext.containerView.backgroundColor = UIColor.clear
            imageView.removeFromSuperview()
            presentedView.alpha = 1.0
            transitionContext.completeTransition(true)
        })
    }
    
    // 消失动画
    fileprivate func animtionForDismiss(transitionContext: UIViewControllerContextTransitioning) {
        // nil值校验
        guard let dismissDelegate = dismissDelegate, let presentedDelegate = presentedDelegate else {
            return
        }
        
        // 1:取出消失的view
        let dismissView = transitionContext.view(forKey: .from)!
        dismissView.removeFromSuperview()
        
        
        // 1:取出消失的view
        let imageView = dismissDelegate.imageViewForDismissView()
        transitionContext.containerView.addSubview(imageView)
        let indexPath = dismissDelegate.indexPathForDismissView()
        
        // 2:执行动画
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            imageView.frame = presentedDelegate.starRect(indexPath: indexPath)
        }, completion: { (_) in
            transitionContext.completeTransition(true)
        })
    }
}



//
//  XJNavigationController.swift
//  Mortgage
//
//  Created by 李胜兵 on 2017/5/16.
//  Copyright © 2017年 善林(中国)金融信息服务有限公司. All rights reserved.
//


import UIKit

class XJNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPanGes()
        setupNavBarButtonItem()
    }
}

extension XJNavigationController {
    fileprivate func setupNavBarButtonItem() {
        // 导航栏字体值
        let attrs : [String : Any] = [NSFontAttributeName : UIFont.systemFont(ofSize: 18), NSForegroundColorAttributeName : UIColor.black]
        navigationBar.titleTextAttributes = attrs
        self.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 2, vertical: -5)
        // 导航栏背景色: 如果没有图片会直接闪退
         navigationBar.setBackgroundImage(UIImage(named: "Nav_bgImg"), for: .any, barMetrics: .default)
        
        // 去掉导航栏下面线条的
        // navigationBar.shadowImage = UIImage()
    }
}

extension XJNavigationController {
    func setupPanGes() {
        guard let systemGes = interactivePopGestureRecognizer else { return }
        guard let gesView = systemGes.view else { return }
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else { return }
        guard let target = targetObjc.value(forKey: "target") else { return }
        let action = Selector(("handleNavigationTransition:"))
        
        let pan = UIScreenEdgePanGestureRecognizer(target: target, action: action)
        pan.edges = UIRectEdge.left
        //let pan = UIPanGestureRecognizer(target: target, action: action)
        gesView.addGestureRecognizer(pan)
        pan.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = false
    }
}

extension XJNavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Nav_back"), style: .done, target: self, action: #selector(XJNavigationController.backBtnClick))
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc fileprivate func backClick() {
        popViewController(animated: true)
    }
}

extension XJNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        if childViewControllers.count == 1 {
            return false
        }
        return true
    }
}

extension XJNavigationController {
    func backBtnClick() {
        popViewController(animated: true)
    }
}


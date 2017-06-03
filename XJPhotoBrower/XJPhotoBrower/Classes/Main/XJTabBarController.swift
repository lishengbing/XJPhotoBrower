//
//  XJTabBarController.swift
//  MortgageBusiness
//
//  Created by 李胜兵 on 2017/5/18.
//  Copyright © 2017年 善林(中国)金融信息服务有限公司. All rights reserved.
//

import UIKit

class XJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllChildVC()
    }

    fileprivate func setupAllChildVC() {
        addChildVC(XJBaseVC(), title: "首页", imageName: "home_homepage")
        addChildVC(XJBaseVC(), title: "订单", imageName: "home_order")
        addChildVC(XJBaseVC(), title: "我的", imageName: "home_my")
        // 设置全局tabBar颜色
        UITabBar.appearance().tintColor = UIColor.orange
    }

}

extension XJTabBarController {
    fileprivate func addChildVC(_ childVC: UIViewController, title : String, imageName : String) {
        childVC.title = title
        childVC.tabBarItem.image = UIImage(named: "\(imageName)_nor")
        childVC.tabBarItem.selectedImage = UIImage(named: "\(imageName)")
        let nav = XJNavigationController(rootViewController: childVC)
        addChildViewController(nav)
    }
}

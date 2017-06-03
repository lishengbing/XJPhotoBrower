//
//  XJBaseVC.swift
//  XJPhotoBrower
//
//  Created by shanlin on 2017/6/3.
//  Copyright © 2017年 shanlin. All rights reserved.
//

import UIKit
private let kCellId = "kCellId"

private let kColumn: CGFloat = 4
private let kLeftMargin: CGFloat = 13
private let kRightMargin: CGFloat = 12
private let kMiddleMargin: CGFloat = 10
private let kSizeW: CGFloat = (kScreenW - kLeftMargin - kRightMargin - (kColumn - 1) * kMiddleMargin) / kColumn

class XJBaseVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate lazy var images = [UIImage]()
    fileprivate lazy var photoBrowerVC = XJPhotoBrowerVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...10 {
            let image = UIImage(named: "0\(i)")
            images.append(image!)
        }
        setupUI()
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: kSizeW, height: kSizeW)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(9, 13, 9, 12)
        layout.scrollDirection = .vertical
    }
    
   
}

extension XJBaseVC {
    fileprivate func setupUI() {
        navigationItem.title = "图片浏览器"
        view.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName: "XJBaseViewCell", bundle: nil), forCellWithReuseIdentifier: kCellId)
    }
}

extension XJBaseVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellId, for: indexPath) as! XJBaseViewCell
        cell.imgView.image = UIImage(named: "0\(indexPath.item + 1)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoBrowerVC = XJPhotoBrowerVC(indexPath: indexPath, images: images, vc:self)
        self.photoBrowerVC = photoBrowerVC
        photoBrowerVC.modalPresentationStyle = .custom
        present(photoBrowerVC, animated: true, completion: nil)
    }
}


extension XJBaseVC: AnimatorPresentedDelegate {
    func starRect(indexPath: IndexPath) -> CGRect {
       return photoBrowerVC.starRect(belowCollection: collectionView, indexPath: indexPath)
    }
    
    func endRect(indexPath: IndexPath) -> CGRect {
       return photoBrowerVC.endRect(indexPath: indexPath)
    }
    
    func imageView(indexPath: IndexPath) -> UIImageView {
       return photoBrowerVC.imageView(indexPath: indexPath)
    }
}




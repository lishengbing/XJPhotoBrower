
XJPhotoBrower 图片浏览器

#_记得点击star、不定期更新、不定时问鼎、不定时颠覆；可记否！

#_XJPhotoBrower

#_最强大的XJPhotoBrower问鼎

> _XJPhotoBrowerVC.swift: 主控制器

> _XJPhotoBrowerCell: 主控制器内容cell

> _XJPhotoBrowerAnimator: 动画协议类

#_使用说明

> 1: 创建：let photoBrowerVC = XJPhotoBrowerVC(indexPath: indexPath, images: images, vc:self)

> 2: 00 fileprivate lazy var photoBrowerVC = XJPhotoBrowerVC() 
     01 self.photoBrowerVC = photoBrowerVC

> 3: photoBrowerVC.modalPresentationStyle = .custom

> 4: present(photoBrowerVC, animated: true, completion: nil)

> 5: 实现三个方法书写，不需要你处理，只需要在你当前控制器中继承即可：

例如:
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


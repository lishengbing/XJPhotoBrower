
## 图片浏览器
XJPhotoBrower 

#_记得点击star、不定期更新、不定时问鼎、不定时颠覆；可记否！

#_XJPhotoBrower

#_最强大的XJPhotoBrower问鼎

> _XJPhotoBrowerVC.swift: 主控制器

> _XJPhotoBrowerCell: 主控制器内容cell

> _XJPhotoBrowerAnimator: 动画协议类

#_使用说明

> 1: 创建：

>_let photoBrowerVC = XJPhotoBrowerVC(indexPath: indexPath, images: images, vc:self)

>_fileprivate lazy var photoBrowerVC = XJPhotoBrowerVC()

> 2: 保存属性:  

>_self.photoBrowerVC = photoBrowerVC

> 3: 设置model类型:

>_photoBrowerVC.modalPresentationStyle = .custom

> 4: 模态出来:

>_present(photoBrowerVC, animated: true, completion: nil)

> 5: 实现代理 <三个方法书写，不需要你处理，只需要在你当前控制器中这样写即可>

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


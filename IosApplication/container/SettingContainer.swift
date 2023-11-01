//
//  SettingContainer.swift
//  设置页面
//
//  Created by 小杨 on 2023/11/1.
//

import UIKit

class SettingContainer: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        title = "设置页面"
        
        view.addSubview(settingView)
        view.addSubview(collectView)
        
        //添加约束，只有添加当前控件，内部的约束在空间内部就添加了
        settingView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.height.equalTo(55)
        }
        
        collectView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(settingView.snp.bottom).offset(1)
            make.height.equalTo(55)
        }
    }

    @objc func onSettingClick(recognizer: UITapGestureRecognizer) {
        print("onSettingClick")
    }

    /// 设置Item
    lazy var settingView: SettingView = {
        let r = SettingView()
        
        //设置点击事件
        r.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onSettingClick(recognizer: ))))
        
        return r
    }()

    /// 收藏Item
    lazy var collectView: SettingView = {
        let r = SettingView()
        // 通过文档注释才能对组件内部属性有提示
        r.titleView.text = "收藏"
        r.iconView.image = UIImage(named:"Setting")
        return r
    }()

}

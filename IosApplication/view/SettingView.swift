//
//  SettingView.swift
//  设置itemView
//
//  Created by 小杨 on 2023/11/1.
//

import UIKit

class SettingView: UIView {

    init() {
        super.init(frame: CGRect.zero)
        innerInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        innerInit()
    }
        
    func innerInit() {
        backgroundColor = .white
        addSubview(iconView)
        addSubview(titleView)
        addSubview(moreIconView)
    }
    
    /// 当视图加入父视图时 / 当视图从父视图移除时调用
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        ///添加约束
        iconView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        titleView.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }
        
        moreIconView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    /// 左侧图标
    lazy var iconView: UIImageView = {
        let result = UIImageView()
        result.image = UIImage(named: "Setting")
        return result
    }()
    
    /// 标题
    lazy var titleView: UILabel = {
        let result = UILabel()
        result.text = "设置"
        result.textColor = .black
        return result
    }()
    
    /// 右侧标题
    lazy var moreIconView: UIImageView = {
        let result = UIImageView()
        result.image = UIImage(named: "Arrow")
        return result
    }()

}

//
//  ViewController.swift
//  IosApplication
//
//  Created by 小杨 on 2023/10/28.
//

import UIKit

// 自动布局框架
import SnapKit

class ViewController: UIViewController {
    var container:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
        
        // MARK: - 控件
        //添加一个根容器
        self.container = UIView()
        container.backgroundColor = .white
        view.addSubview(container)
        // self.container.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        
        //logo
        let loginView = UIImageView()
        loginView.image = UIImage(named: "Logo")
        container.addSubview(loginView)
        
        // MARK: - 手机号登陆按钮
        container.addSubview(phoneLoginButton)
        
        // MARK: - 登陆按钮
        container.addSubview(primaryButton)
        
        // MARK: - 协议
        let agrementLabelView = UILabel()
        
        //设置标题
        agrementLabelView.text = "登陆即表示你同意《用户协议》和《隐私政策》"
        
        agrementLabelView.font = UIFont.systemFont(ofSize: 12)
        agrementLabelView.textColor = .gray
        container.addSubview(agrementLabelView)
        
        // MARK: - 约束
        container.snp.makeConstraints { make in
            //正数表示向下
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            
            //负数表示向上
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            
            // 两者效果相同
            // make.top.equalTo(self.view.snp.top)
            // make.top.equalToSuperview()
        }
        
        // MARK: - Logo
        loginView.snp.makeConstraints { make in
            //宽高
            make.width.equalTo(100)
            make.height.equalTo(100)
            
            //距离顶部
            make.top.equalTo(100)
            
            //水平剧中
            // make.centerX.equalTo(container.snp.centerX)
            make.centerX.equalToSuperview()
        }
        
        // MARK: - 协议
        agrementLabelView.snp.makeConstraints { make in
            //距离底部
            make.bottom.equalToSuperview()
            
            //水平居中
            make.centerX.equalToSuperview()
        }
        
        // MARK: - 登陆按钮
        primaryButton.snp.makeConstraints { make in
            //宽和父窗口体一样
            make.width.equalToSuperview()
            make.height.equalTo(42)
            
            //底部
            make.bottom.equalTo(agrementLabelView.snp.top).offset(-30)
        }
        
        // MARK: - 手机号按钮
        phoneLoginButton.snp.makeConstraints { make in
            //宽和父窗口体一样
            make.width.equalToSuperview()
            make.height.equalTo(42)
            
            //底部
            make.bottom.equalTo(primaryButton.snp.top).offset(-30)
        }
    }
    
    //@objc固定写法，书写后才支持在Selector中进行选择该方法
    //_ 可写可不写，区别在于调用方法时需要指定字段名称与否，无_时需要指定字段名称
    @objc func phoneLoginClick(_ sender:UIButton) {
        print("ViewController phoneLoginClick \(String(describing: sender.titleLabel?.text))")
        
        let r = SettingContainer()
        navigationController?.pushViewController(r, animated: true)
    }
    
    lazy var phoneLoginButton: UIButton = {
        let r = UIButton(type: .system)
        
        //设置标题
        r.setTitle("手机号登录", for: .normal)

        //设置点击事件
        r.addTarget(self, action: #selector(phoneLoginClick(_:)), for: .touchUpInside)

        r.backgroundColor = .red

        //圆角大小
        r.layer.cornerRadius = 5

        //标题默认颜色
        r.setTitleColor(.white, for: .normal)

        //按下文本颜色
        r.setTitleColor(.gray, for: .highlighted)
        
        return r
    }()
    
    @objc func primaryClick(_ sender:UIButton) {
        print("ViewController primaryClick \(String(describing: sender.titleLabel?.text))")
    }
 
    lazy var primaryButton: UIButton = {
        let r = UIButton(type: UIButton.ButtonType.system)
        
        //设置标题
        r.setTitle("用户名和密码登录", for: .normal)
        
        r.backgroundColor = .clear
        
        r.layer.cornerRadius = 21
        
        r.layer.borderWidth = 1
        r.layer.borderColor = UIColor.red.cgColor
        
        r.setTitleColor(.red, for: UIControl.State.normal)
        
        //设置点击事件
        r.addTarget(self, action: #selector(primaryClick(_:)), for: UIControl.Event.touchUpInside)
        
        //按下文本颜色
        r.setTitleColor(.gray, for: .highlighted)
        
        return r
    }()
    
}


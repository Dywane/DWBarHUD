//
//  BarHUDViewController.swift
//  DWBarHUDDemo
//
//  Created by duwei on 2018/4/19.
//  Copyright © 2018年 Dywane. All rights reserved.
//

import UIKit

public enum BarHUDType {
    case success
    case fail
    case warning
    case `default`
}

class BarHUDViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var HUDView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var messageBoard: UILabel!
    
    @IBOutlet weak var iconWidthConstrain: NSLayoutConstraint!
    @IBOutlet weak var HUDHeightConstrain: NSLayoutConstraint!
    
    var HUDConfig: HUDConfig!
    private var type: BarHUDType = .default
    private var message: String!
    
    //MARK; - Public methods
    
    /// 使用该方法基于DWBarHUD的子类对view进行配置
    func setup(HUDSetter: HUDConfig, type: BarHUDType = .default, message: String) {
        HUDConfig = HUDSetter
        self.type = type
        self.message = message
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        view.isUserInteractionEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Private Methods
extension BarHUDViewController {
    // display
    private func present() {
        
        func dismissInTime() {
            if self.HUDConfig.displayDuration > 0 {
                let time = DispatchTime.now() + self.HUDConfig.displayDuration
                DispatchQueue.main.asyncAfter(deadline: time) {
                    self.dismiss()
                }
            } else {
                fatalError("display duration must above zero")
            }
        }
        
        switch HUDConfig.animationType {
        case .spring:
            springAppear { (_) in
                dismissInTime()
            }
        case .fade:
            fadeAppear { (_) in
                dismissInTime()
            }
        default:
            defaultAppear { (_) in
                dismissInTime()
            }
        }
    }
    
    private func dismiss() {
        switch HUDConfig.animationType {
        case .spring:
            springDisappear { (_) in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            }
        case .fade:
            fadeDisappear { (_) in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            }
        default:
            defaultDisappear { (_) in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            }
        }
    }
    
    //MARK: setup
    private func configViews() {
        // base setup
        messageBoard.font = HUDConfig.barMessageFont
        messageBoard.textColor = HUDConfig.barMessageFontColor
        messageBoard.text = message
        iconImageView.isHidden = !HUDConfig.showIcon
        HUDHeightConstrain.constant = HUDConfig.barHeight
        
        // type define setup
        switch type {
        case .success:
            if let icon = HUDConfig.barSuccessIcon {
                iconImageView.image = icon
            } else {
                iconImageView.isHidden = true
            }
            HUDView.backgroundColor = HUDConfig.barSuccessColor
        case .fail:
            if let icon = HUDConfig.barFailedIcon {
                iconImageView.image = icon
            } else {
                iconImageView.isHidden = true
            }
            HUDView.backgroundColor = HUDConfig.barFailedColor
        case .warning:
            if let icon = HUDConfig.barWarningIcon {
                iconImageView.image = icon
            } else {
                iconImageView.isHidden = true
            }
            HUDView.backgroundColor = HUDConfig.barWarningColor
        default:
            if let icon = HUDConfig.barDefaultIcon {
                iconImageView.image = icon
            } else {
                iconImageView.isHidden = true
            }
            HUDView.backgroundColor = HUDConfig.barDefaultColor
        }
        if iconImageView.isHidden {
            iconWidthConstrain.constant = 0
        } else {
            iconWidthConstrain.constant = 50
        }
    }
}

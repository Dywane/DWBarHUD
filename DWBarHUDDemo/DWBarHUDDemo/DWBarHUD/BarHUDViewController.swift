//
//  BarHUDViewController.swift
//  DWBarHUDDemo
//
//  Created by duwei on 2018/4/19.
//  Copyright © 2018年 Dywane. All rights reserved.
//

import UIKit

enum BarHUDType {
    case success
    case fail
    case warning
    case defaultType
}

class BarHUDViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var messageBoard: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var HUDType: BarHUDType = .defaultType
    
    //MARK; - Public methods
    
    /// 使用该方法基于DWBarHUD的子类对view进行配置
    func setupViews(HUDSetter: HUDConfig, type: BarHUDType = .defaultType, message: String) {
        // base setup
        view.frame.size.height = HUDSetter.barHeight
        messageBoard.font = HUDSetter.barMessageFont
        messageBoard.textColor = HUDSetter.barMessageFontColor
        messageBoard.text = message
        iconImageView.isHidden = !HUDSetter.showIcon
        actionButton.isHidden = !HUDSetter.showActionButton
        actionButton.setTitle(HUDSetter.barActionButtonTitle, for: .normal)
        actionButton.setTitleColor(HUDSetter.barActionButtonTitleColor, for: .normal)
        actionButton.titleLabel?.font = HUDSetter.barActionButtonFont
        
        // type define setup
        switch type {
        case .success:
            if let icon = HUDSetter.barSuccessIcon {
                iconImageView.image = icon
            } else {
                iconImageView.isHidden = true
            }
            view.backgroundColor = HUDSetter.barSuccessColor
        case .fail:
            if let icon = HUDSetter.barFailIcon {
                iconImageView.image = icon
            } else {
                iconImageView.isHidden = true
            }
            view.backgroundColor = HUDSetter.barFailColor
        case .warning:
            if let icon = HUDSetter.barWarningIcon {
                iconImageView.image = icon
            } else {
                iconImageView.isHidden = true
            }
            view.backgroundColor = HUDSetter.barWarningColor
        default:
            if let icon = HUDSetter.barDefaultIcon {
                iconImageView.image = icon
            } else {
                iconImageView.isHidden = true
            }
            view.backgroundColor = HUDSetter.barDefaultColor
        }
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

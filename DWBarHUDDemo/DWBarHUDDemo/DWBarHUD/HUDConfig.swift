//
//  DWBarHUD.swift
//  DWBarHUDDemo
//
//  Created by duwei on 2018/4/19.
//  Copyright © 2018年 Dywane. All rights reserved.
//

import UIKit

/// 使用该protocl进行自定义
internal protocol DWBarProtocol {
    
    var barHeight: CGFloat { get }
    // icon setting
    var barSuccessIcon: UIImage? { get }
    var barWarningIcon: UIImage? { get }
    var barFailIcon: UIImage? { get }
    var barDefaultIcon: UIImage? { get }
    var showIcon: Bool { get }
    
    // background color setting
    var barSuccessColor: UIColor { get }
    var barFailColor: UIColor { get }
    var barWarningColor: UIColor { get }
    var barDefaultColor: UIColor { get }
    
    // font setting
    var barMessageFont: UIFont { get }
    var barMessageFontColor: UIColor { get }
    
    // action button setting
    var barActionButtonTitle: String? { get }
    var barActionButtonTitleColor: UIColor { get }
    var barActionButtonFont: UIFont { get }
    var showActionButton: Bool { get }
}

internal struct HUDConfig: DWBarProtocol {
    
    // MARK: - Properties
    
    // MARK: - DWBarProtocol
    /// 成功状态Icon
    var barSuccessIcon: UIImage?
    /// 警告状态Icon
    var barWarningIcon: UIImage?
    /// 失败状态Icon
    var barFailIcon: UIImage?
    /// 普通状态Icon
    var barDefaultIcon: UIImage?
    /// HUD高度
    var barHeight: CGFloat = 50
    /// 成功状态背景颜色
    var barSuccessColor: UIColor = .green
    /// 失败状态背景颜色
    var barFailColor: UIColor = .red
    /// 警告状态背景颜色
    var barWarningColor: UIColor = .yellow
    /// 普通状态背景颜色
    var barDefaultColor: UIColor = .lightGray
    /// 提示信息字体
    var barMessageFont: UIFont = UIFont.systemFont(ofSize: 14)
    /// 提示信息字体颜色
    var barMessageFontColor: UIColor = .white
    /// 按钮标题
    var barActionButtonTitle: String? = nil
    /// 按钮标题颜色
    var barActionButtonTitleColor: UIColor = .white
    /// 按钮标题字体
    var barActionButtonFont: UIFont = UIFont.systemFont(ofSize: 14)
    /// 是否显示按钮
    var showActionButton: Bool = false
    /// 是否显示icon
    var showIcon: Bool = false
    
    func showHUD(type: BarHUDType = .defaultType, message: String) {
        let vc = BarHUDViewController()
        vc.setupViews(HUDSetter: self, type: type, message: message)
    }
}

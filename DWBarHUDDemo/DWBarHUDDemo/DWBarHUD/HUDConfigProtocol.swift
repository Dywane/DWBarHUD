//
//  DWBarHUD.swift
//  DWBarHUDDemo
//
//  Created by duwei on 2018/4/19.
//  Copyright © 2018年 Dywane. All rights reserved.
//

import UIKit

/// 使用该protocl进行自定义
protocol HUDConfigProtocol {
    
    // base setting
    var barHeight: CGFloat { get }
    var displayDuration: TimeInterval { get }
    
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

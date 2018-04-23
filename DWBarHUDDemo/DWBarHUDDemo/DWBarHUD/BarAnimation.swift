//
//  BarAnimation.swift
//  DWBarHUDDemo
//
//  Created by duwei on 2018/4/23.
//  Copyright © 2018年 Dywane. All rights reserved.
//

import UIKit

extension BarHUDViewController {
    
    //MARK: Fade
    func fadeAppear(completion: ((Bool) -> Void)?) {
        HUDView.alpha = 0.15
        UIView.animate(withDuration: HUDConfig.animationDuration, animations: {
            self.HUDView.alpha = 1
        }, completion: completion)
    }
    
    func fadeDisapper(completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: HUDConfig.animationDuration, animations: {
            self.HUDView.alpha = 0.15
        }, completion: completion)
    }
    
    //MARK: Spring
    func springAppear(completion: ((Bool) -> Void)?) {
        let previousFrame = HUDView.frame
        HUDView.frame.origin.y = -HUDConfig.barHeight
        UIView.animate(withDuration: HUDConfig.animationDuration, delay: 0, usingSpringWithDamping: 0.45, initialSpringVelocity: 0.00003, options: .curveEaseIn, animations: {
            self.HUDView.frame.origin.y = previousFrame.origin.y
            self.view.layoutIfNeeded()
        }, completion: completion)
    }
    
    func springDisapper(completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: HUDConfig.animationDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.00003, options: .curveEaseOut, animations: {
            self.HUDView.frame.origin.y = -self.HUDConfig.barHeight
            self.view.layoutIfNeeded()
        }, completion: completion)
    }
    
    //MARK: default
    func defaultAppear(completion: ((Bool) -> Void)?) {
        let previousFrame = HUDView.frame
        HUDView.frame.origin.y = -HUDConfig.barHeight
        UIView.animate(withDuration: HUDConfig.animationDuration, animations: {
            self.HUDView.frame.origin.y = previousFrame.origin.y
            self.view.layoutIfNeeded()
        }, completion: completion)
    }
    
    func defaultDisappear(completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: HUDConfig.animationDuration, animations: {
            self.HUDView.frame.origin.y = -self.HUDConfig.barHeight
            self.view.layoutIfNeeded()
        }, completion: completion)
    }
}

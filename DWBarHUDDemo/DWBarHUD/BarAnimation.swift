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
        iconImageView.alpha = 0.15
        messageBoard.alpha = 0.15
        UIView.animate(withDuration: HUDConfig.animationDuration, animations: {
            self.HUDView.alpha = 1
            self.iconImageView.alpha = 1
            self.messageBoard.alpha = 1
        }, completion: completion)
    }
    
    func fadeDisappear(completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: HUDConfig.animationDuration, animations: {
            self.HUDView.alpha = 0.15
            self.iconImageView.alpha = 0.15
            self.messageBoard.alpha = 0.15
        }, completion: completion)
    }
    
    //MARK: Spring
    func springAppear(completion: ((Bool) -> Void)?) {
        let iconPreviousFrame = iconImageView.frame
        let messagePreviousFrame = messageBoard.frame
        let previousFrame = HUDView.frame
        let currentFrame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 15, y: HUDView.frame.origin.y + 10, width: 30, height: 30)
        HUDView.alpha = 0.4
        HUDView.frame = currentFrame
        iconImageView.frame = currentFrame
        messageBoard.frame = currentFrame
        UIView.animate(withDuration: HUDConfig.animationDuration, delay: 0, usingSpringWithDamping: 0.45, initialSpringVelocity: 0.00003, options: .curveEaseIn, animations: {
            self.HUDView.alpha = 1
            self.HUDView.frame = previousFrame
            self.messageBoard.frame = messagePreviousFrame
            self.iconImageView.frame = iconPreviousFrame
        }, completion: completion)
    }
    
    func springDisappear(completion: ((Bool) -> Void)?) {
        let currentFrame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 15, y: HUDView.frame.origin.y + 10, width: 30, height: 30)
        UIView.animate(withDuration: HUDConfig.animationDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.00003, options: .curveEaseOut, animations: {
            self.HUDView.frame = currentFrame
            self.messageBoard.frame = currentFrame
            self.iconImageView.frame = currentFrame
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

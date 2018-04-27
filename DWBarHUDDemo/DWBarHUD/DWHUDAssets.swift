//
//  DWHUDAssets.swift
//  DWBarHUD
//
//  Created by duwei on 2018/4/27.
//  Copyright © 2018年 Dywane. All rights reserved.
//

import UIKit

open class DWHUDAssets {
    
    public class var successIcon: UIImage? { return DWHUDAssets.bundledImage(named: "sign_check") }
    public class var warningIcon: UIImage? { return DWHUDAssets.bundledImage(named: "sign_warning") }
    public class var failIcon: UIImage? { return DWHUDAssets.bundledImage(named: "sign_ban") }
    public class var defaultIcon: UIImage? { return DWHUDAssets.bundledImage(named: "sign_info") }
    
    class func bundledImage(named name: String) -> UIImage? {
        let bundle = Bundle(for: DWHUDAssets.self)
        let image = UIImage(named: name, in: bundle, compatibleWith: nil)
        return image
    }
}

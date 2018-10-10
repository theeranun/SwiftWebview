//
//  ProductNavigationController.swift
//  TTP APP
//
//  Created by Theeranun Chitcharak on 28/9/2561 BE.
//  Copyright © 2561 Tuktukpass. All rights reserved.
//

import UIKit

class ProductNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }

}

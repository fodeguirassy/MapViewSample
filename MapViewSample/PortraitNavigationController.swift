//
//  PortraitNavigationController.swift
//  MapViewSample
//
//  Created by School on 15/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import Foundation
import UIKit

public class PortraitNavigationController: UINavigationController {
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return self.visibleViewController?.supportedInterfaceOrientations ?? super.supportedInterfaceOrientations
    }
}

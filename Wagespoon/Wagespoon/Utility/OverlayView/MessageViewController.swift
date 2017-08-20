//
//  MessageViewController.swift
//  OverlayViewController
//
//  Created by Andrey Gordeev on 4/17/17.
//  Copyright © 2017 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, OverlayViewController {
    let overlaySize: CGSize? = CGSize(width: UIScreen.main.bounds.width * 1,
                                      height: Constants.ScreenSize.SCREEN_HEIGHT)
    @IBAction func closeButtonPressed() {
        dismissOverlay()
    }
}

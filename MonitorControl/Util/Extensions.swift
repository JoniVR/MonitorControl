//
//  Extensions.swift
//  MonitorControl
//
//  Created by Joni Van Roost on 15/01/2019.
//  Copyright © 2019 Mathew Kurian. All rights reserved.
//  MIT Licensed.
//

import AppKit

extension NSScreen {
    static func externalScreens() -> [NSScreen] {
        guard NSScreen.screens.count != 0 else { return [] }

        return screens.filter {
            guard let deviceID = $0.deviceDescription[NSDeviceDescriptionKey.init("NSScreenNumber")] as? NSNumber else { return false }
            return CGDisplayIsBuiltin(deviceID.uint32Value) == 0
        }
    }
}

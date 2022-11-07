//
//  ActivityKitDemoBundle.swift
//  ActivityKitDemo
//
//  Created by Kevin on 2022/11/7.
//

import WidgetKit
import SwiftUI

@main
struct ActivityKitDemoBundle: WidgetBundle {
    var body: some Widget {
        ActivityKitDemo()
        ActivityKitDemoLiveActivity()
    }
}

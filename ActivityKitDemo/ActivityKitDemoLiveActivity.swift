//
//  ActivityKitDemoLiveActivity.swift
//  ActivityKitDemo
//
//  Created by Kevin on 2022/11/7.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ActivityKitDemoAttributes: ActivityAttributes {
    public typealias ActivityDataStatus = ContentState

    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: String
    }

}

struct ActivityKitDemoLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ActivityKitDemoAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text(context.state.value)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Image("doge")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Image("wu")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("牛肉麵")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("油漆")
                    // more content
                }
            } compactLeading: {
                Image("doge")
                    .resizable()
                    .frame(width: 32, height: 32)
            } compactTrailing: {
                Image("wu")
                    .resizable()
                    .frame(width: 32, height: 32)
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

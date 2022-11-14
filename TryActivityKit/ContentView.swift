//
//  ContentView.swift
//  TryActivityKit
//
//  Created by Kevin on 2022/11/4.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("老吳的世界!")
            Button("老吳與狗") {
                dogShowUp()
            }
            Button("老吳餵狗") {
                feedDog()
            }
            Button("去吃牛肉麵離開了") {
                dogGone()
            }
        }
        .padding()
    }
    
    func dogShowUp() {
        let testAttributes = ActivityKitDemoAttributes()
        let dogStatus = ActivityKitDemoAttributes.ActivityDataStatus(value: "老吳的狗")
        do{
            let dogActivity = try Activity<ActivityKitDemoAttributes>.request(
                attributes: testAttributes,
                contentState: dogStatus)
            print("Did request live activity \(dogActivity.id)")
        }catch(let error){
            print("Error requesting live activity \(error.localizedDescription)")
        }
    }
    
    func feedDog() {
        Task{
            for activity in Activity<ActivityKitDemoAttributes>.activities {
                await activity.update(using: Activity<ActivityKitDemoAttributes>.ContentState(value: "餵個狗狗"))
            }
        }
    }
    
    func dogGone() {
        Task{
            for activity in Activity<ActivityKitDemoAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

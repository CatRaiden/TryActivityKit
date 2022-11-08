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
            Text("Hello, world!")
            Button("Show ad 🎟") {
                shoeTripAd()
            }
            
            Button("Stop ad 🎟") {
                stopAd()
            }
        }
        .padding()
    }
    
    func shoeTripAd() {
        let liveTripAttributes = ActivityKitDemoAttributes()
        let tripStatus = ActivityKitDemoAttributes.ContentState(value: 10)
        do{
            let tripActivity = try Activity<ActivityKitDemoAttributes>.request(
                attributes: liveTripAttributes,
                contentState: tripStatus)
            print("Did request live trip activity \(tripActivity.id)")
        }catch(let error){
            print("Error requesting live activity \(error.localizedDescription)")
        }
    }
    
    func stopAd() {
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

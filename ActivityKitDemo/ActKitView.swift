//
//  ActKitView.swift
//  TryActivityKit
//
//  Created by Kevin on 2022/11/7.
//

import SwiftUI

struct TrainTripView: View {
    @State var trinDistance : Float
    @State var shouldShowDistance : Bool = true
    var body: some View {
        VStack{
            HStack{
                Text("Your 9.45 trian in on its way".capitalized)
                Image(systemName: "train.side.front.car")
                Spacer()
            }
            if shouldShowDistance {
                ProgressView("Five Kings Station", value: trinDistance, total: 100)
                    .padding()
                    .font(.caption2)
            }
            HStack{
                Text("no delays expected.".capitalized)
                Spacer()
            }
        }
        .padding()
    }
}

struct TrainTripView_Previews: PreviewProvider {
    static var previews: some View {
        TrainTripView(trinDistance: 25.0)
            .previewLayout(PreviewLayout.fixed(width: 400, height: 200))
    }
}

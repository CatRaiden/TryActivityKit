//
//  ActKitView.swift
//  TryActivityKit
//
//  Created by Kevin on 2022/11/7.
//

import SwiftUI

struct FeedingView: View {
    var body: some View {
        VStack{
            HStack{
                Text("老吳的狗喜歡吃牛肉麵～".capitalized)
                Spacer()
            }
            HStack {
                Image("doge")
                    .resizable()
                    .frame(width: 50, height: 50)
                ProgressView("老吳好感度", value: 50, total: 100)
                    .padding()
                .font(.caption2)
                Image("wu")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            HStack{
                Text("也喜歡裝修與做麵包".capitalized)
                Spacer()
            }
        }
        .padding()
    }
}

struct FeedingView_Previews: PreviewProvider {
    static var previews: some View {
        FeedingView()
            .previewLayout(PreviewLayout.fixed(width: 400, height: 200))
    }
}

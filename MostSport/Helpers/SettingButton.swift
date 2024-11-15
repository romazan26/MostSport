//
//  SettingButton.swift
//  MostSport
//
//  Created by Роман on 15.11.2024.
//

import SwiftUI

struct SettingButton: View {
    var text = ""
    var imageName = ""
    var body: some View {
        ZStack {
            Color(.whiteBlue)
                .cornerRadius(20)
                
            VStack {
                Text(text)
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            .padding()
            .foregroundStyle(.text)
                .font(.system(size: 12, weight: .heavy))
        }
        .frame(width: 115, height: 68)
    }
}

#Preview {
    SettingButton()
}

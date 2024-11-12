//
//  CstomButtonIntro.swift
//  MostSport
//
//  Created by Роман on 11.11.2024.
//

import SwiftUI

struct CustomButtonIntro: View {
    var body: some View {
        HStack {
            Text("Next")
                .foregroundStyle(.black)
                .font(.system(size: 17))
            Image(systemName: "chevron.right.square.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(.orangeApp)
        }
    }
}

#Preview {
    CustomButtonIntro()
}

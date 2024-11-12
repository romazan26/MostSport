//
//  CustomTabItem.swift
//  MostSport
//
//  Created by Роман on 11.11.2024.
//

import SwiftUI

struct CustomTabItemView: View {
    var image: String
    var text: String
    var body: some View {
        VStack {
            Image(systemName: image)
            Text(text)
        }
    }
}

#Preview {
    CustomTabItemView(image: "heart", text: "fake")
}

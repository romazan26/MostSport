//
//  CoachCellView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct CoachCellView: View {
    var coach: User?
    var body: some View {
        HStack {
            if let dataImage = coach?.photo {
                if let photo = UIImage(data: dataImage) {
                    Image(uiImage: photo)
                        .resizable()
                        .clipShape(.circle)
                        .frame(width: 44,height: 44)
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                        
                }
            }else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .clipShape(.circle)
                    .frame(width: 44,height: 44)
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
            }
            Text("Hello, Coach \(coach?.name ?? "")! You're managing the \(coach?.team ?? "")")
                .multilineTextAlignment(.leading)
                .foregroundStyle(.text)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background {
            Color.whiteBlue.cornerRadius(16)
        }
    }
}

#Preview {
    CoachCellView()
}

//
//  PageIntroView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct PageIntroView: View {
    var page: PageIntro
    
    var body: some View {

        ZStack(alignment: .bottom) {
            
            Image(page.imageUrl)
                .resizable()
                .padding()
            VStack(spacing: 10) {
                Text(page.text)
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                Text(page.secondText)
                    .foregroundStyle(.black)
                Spacer()
            }
            .frame(height: 240)
            .frame(maxWidth: .infinity)
            .background {
                Color.white.cornerRadius(16).ignoresSafeArea()
            }
        }
                        
 
    }
}


#Preview {
    ZStack {
        Color.main
        PageIntroView(page: PageIntro.samplePage)
    }
}

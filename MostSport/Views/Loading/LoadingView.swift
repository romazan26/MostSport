//
//  ContentView.swift
//  MostSport
//
//  Created by Роман on 11.11.2024.
//

import SwiftUI

struct LoadingView: View {
    @StateObject var vm = LoadingViewModel()
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            Image(.logo)
                .resizable()
                .frame(width: 143, height: 108)
            ProgressView()
                .colorScheme(.dark)
                .padding(.top, 350)
        }
        .fullScreenCover(isPresented: $vm.isPresent, content: {
            if vm.isFirstLaunch ?? true {
                IntroView()
            }else{
                MainView()
            }
        })
        .onAppear(perform: {
            vm.starttimer()
        })
    }
}

#Preview {
    LoadingView()
}

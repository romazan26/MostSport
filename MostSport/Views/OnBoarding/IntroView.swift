//
//  IntroView.swift
//  FastTrack
//
//  Created by Роман on 12.08.2024.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool?
    
    @State private var isPresented = false
    @State private var pageIndex = 0
    @Environment(\.dismiss) var dismiss
    
    private let pages: [PageIntro] = PageIntro.sampalePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            Color.main.ignoresSafeArea()
            TabView(selection: $pageIndex,
                    content:  {
                ForEach(pages) { page in
                    PageIntroView(page: page)
                        .tag(page.tag)
                        
                }
            })
            .ignoresSafeArea()
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        
               
                //MARK: - Navigation Button
                Button(action: {
                    pageIndex += 1
                    print(pageIndex)
                    if pageIndex > pages.count - 1 {
                        isPresented = true
                        if isFirstLaunch ?? true{
                            isFirstLaunch = false
                        }
                    }
                }, label: {
                    CstomButtonIntro()
                }).padding(.horizontal, 30)
            
        }
        .fullScreenCover(isPresented: $isPresented, content: {
           // MainView()
        })
    }
    
}

#Preview {
    IntroView()
}


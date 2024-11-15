//
//  SettingsView.swift
//  MostSport
//
//  Created by Роман on 14.11.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isPresentShare = false
    @State private var isPresentPolicy = false
    @State var urlShare = "https://www.apple.com/app-store/"
    @State var urlPrivacy = "https://www.apple.com/app-store/"
    
    var body: some View {

        VStack(alignment: .leading) {
            Text("Settigs")
                .foregroundStyle(.text)
                .font(.largeTitle)
            HStack{
                
                //MARK: - Share App Button
                Button(action: {isPresentShare.toggle()}, label: {
                    SettingButton(text: "Share app", imageName: "arrowshape.turn.up.right.fill")
                })
                
                //MARK: - Rate App Button
                Button {
                    SKStoreReviewController.requestReview()
                } label: {
                    SettingButton(text: "Rate App", imageName: "star.fill")
                }
                
                //MARK: - Privacy button
                Button(action: {isPresentPolicy.toggle()}, label: {
                    SettingButton(text: "Usege policy", imageName: "book.closed.fill")
                })
            }
            
            .sheet(isPresented: $isPresentShare, content: {
                ShareSheet(items: urlShare )
            })
            .sheet(isPresented: $isPresentPolicy, content: {
                WebViewPage(urlString: URL(string: urlPrivacy)!)
            })
            Spacer()
        }.padding()
        }
        
    }


#Preview {
    NavigationView {
        SettingsView()
    }
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

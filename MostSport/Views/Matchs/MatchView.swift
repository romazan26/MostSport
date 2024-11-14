//
//  MatchView.swift
//  MostSport
//
//  Created by Роман on 14.11.2024.
//

import SwiftUI

struct MatchView: View {
    @ObservedObject var match: Match
    @StateObject var vm: MatchViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            VStack {
                MatchCellView(match: match)
                Spacer()
                
                //MARK: - Delete button
                Button {
                    vm.delteMatch(match)
                    dismiss()
                } label: {
                    Image(systemName: "archivebox.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 28, height: 28)
                }
                .padding(10)
                .background {
                    Color(.red).cornerRadius(10)
                }
                
            }
            
            if vm.isPresentEditMatchView{
                EditMatchView(vm: vm)
            }
            
            
        }
        .toolbar {
            ToolbarItem {
                //MARK: - Edit button
                Button {
                    vm.isPresentEditMatchView = true
                    vm.feelData(match)
                } label: {
                    Image(systemName: "pencil.line")
                        .resizable()
                        .foregroundStyle(.red)
                        .frame(width: 28, height: 28)
                }
                
            }
        }
    }
}

#Preview {
    MatchView(match: Match(), vm: MatchViewModel())
}

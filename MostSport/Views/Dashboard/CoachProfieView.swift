//
//  CoachProfieView.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct CoachProfieView: View {
    @StateObject var vm: CoachViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState var keyboardFocus: Bool
    var body: some View {
        VStack {
            HStack {
                
                //MARK: - Image user
                if let selectedImage = vm.selectedImage {
                    Button {
                        vm.showImagePicker = true
                    } label: {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                } else {
                    Button {
                        vm.showImagePicker = true
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .foregroundStyle(.gray)
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .cornerRadius(100)
                            .padding()
                    }
                }
                
                VStack{
                    //MARK: - User name
                    HStack {
                        Text("Name")
                            .padding(5)
                        TextField("Enter your name", text: $vm.simpleName)
                            .focused($keyboardFocus)
                        
                    }
                    
                    //MARK: - Team
                    HStack {
                        Text("Team")
                            .padding(5)
                        TextField("Enter team name", text: $vm.simpleTeam)
                            .focused($keyboardFocus)
                    }
                }.foregroundStyle(.black)
            }
            .sheet(isPresented: $vm.showImagePicker) {
                ImagePicker(image: $vm.selectedImage)
            }
            
            Spacer()
            
            //MARK: - Goup of button
            HStack {
                //MARK: - Delete button
                Button {
                    vm.clearData()
                } label: {
                    Image(systemName: "xmark.app.fill")
                        .resizable()
                        .foregroundStyle(vm.simpleName.isEmpty || vm.simpleTeam.isEmpty ? .whiteBlue : .red)
                }
                .frame(width: 48, height: 48)
                
                //MARK: - Save button
                Button {
                    vm.updateUser()
                    dismiss()
                } label: {
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .foregroundStyle(vm.simpleName.isEmpty || vm.simpleTeam.isEmpty ? .whiteBlue : .green)
                }
                .frame(width: 48, height: 48)

            }
            .navigationTitle("Coach profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onTapGesture {
            keyboardFocus = false
        }
        .onAppear {
            vm.loadUser()
        }
        
    }
}

#Preview {
    NavigationView {
        CoachProfieView(vm: CoachViewModel())
    }
}

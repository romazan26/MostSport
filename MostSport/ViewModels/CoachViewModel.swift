//
//  CoatchViewModel.swift
//  MostSport
//
//  Created by Роман on 12.11.2024.
//

import SwiftUI

struct User: Codable {
    var name: String
    var photo: Data?
    var team: String
    
}

final class CoachViewModel: ObservableObject {
    @Published var showImagePicker = false
    
    @Published var simpleName = ""
    @Published var simpleTeam = ""
    @Published var selectedImage: UIImage? = nil
    @Published var user: User? {
           didSet {
               saveUser()
           }
       }
       
       init() {
           loadUser()
       }
    //MARK: - User Default
       private func saveUser() {
           guard let user = user else { return }
           
           if let encodedUser = try? JSONEncoder().encode(user) {
               UserDefaults.standard.set(encodedUser, forKey: "user")
           }
       }
       
        func loadUser() {
           if let savedUserData = UserDefaults.standard.data(forKey: "user"),
              let decodedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
               user = decodedUser
               simpleName = user?.name ?? ""
               simpleTeam = user?.team ?? ""
           }
       }
       
    func updateUser() {
        let photoData = selectedImage?.jpegData(compressionQuality: 0.8)
        user = User(name: simpleName, photo: photoData, team: simpleTeam)
       }
    
    func clearData() {
        selectedImage = nil
        simpleName = ""
        simpleTeam = ""
    }
}


extension Image {
    /// Initializes a SwiftUI `Image` from data.
    init?(data: Data) {
        #if canImport(UIKit)
        if let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            return nil
        }
        #elseif canImport(AppKit)
        if let nsImage = NSImage(data: data) {
            self.init(nsImage: nsImage)
        } else {
            return nil
        }
        #else
        return nil
        #endif
    }
}


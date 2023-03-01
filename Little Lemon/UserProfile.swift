//
//  UserProfile.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-02-28.
//

import SwiftUI

struct UserProfile: View {
    
    
    @Environment(\.presentationMode) var presentation
    
    var firstName: String
    let lastName: String
    let email : String
    
    @State var logOutAlert = "Are you sure you want to log out"
    @State private var showLogOutAlert = false
    
    init() {
        let defaults = UserDefaults.standard
        firstName = defaults.string(forKey: "kFirstName") ?? ""
        lastName = defaults.string(forKey: "kLastName") ?? ""
        email = defaults.string(forKey: "kEmail") ?? ""
    }
    
    
    var body: some View {
        
            VStack{
                Text("Personal information")
                Image("profilePlaceholder")
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFit()
                
                Form(){
                    
                    Section("Last Name: "){
                        Text("\(firstName)")
                    }
                    Section("Last Name: "){
                        Text("\(lastName)")
                    }
                    Section("email:"){
                        Text("\(email)")
                    }
                    Button("Logout"){
                        UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                        presentation.wrappedValue.dismiss()
                        
                        
                    }
                    .padding(.horizontal, 126.0)
                    //
                }
                .cornerRadius(25)
                .ignoresSafeArea()
                .padding(.top, 15.0)
                .padding(.bottom, 3.0)
                
                
                
            
        }
    }
    
}
struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

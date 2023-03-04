//
//  UserProfile.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-02-28.
//

//import SwiftUI
//
//struct UserProfile: View {
//
//
//    @Environment(\.presentationMode) var presentation
//
//    var firstName: String
//    let lastName: String
//    let email : String
//
//    @State var logOutAlert = "Are you sure you want to log out"
//    @State private var showLogOutAlert = false
//
//    init() {
//        let defaults = UserDefaults.standard
//        firstName = defaults.string(forKey: "kFirstName") ?? ""
//        lastName = defaults.string(forKey: "kLastName") ?? ""
//        email = defaults.string(forKey: "kEmail") ?? ""
//    }
//
//
//    var body: some View {
//
//            VStack{
//
//                Text("Personal information")
//                Image("Profile")
//                    .resizable()
//                    .clipShape(Circle())
//                    .frame(width: 100, height: 100)
//                    .scaledToFit()
//
//                Form(){
//
//                    Section("Last Name: "){
//                        Text("\(firstName)")
//                    }
//                    Section("Last Name: "){
//                        Text("\(lastName)")
//                    }
//                    Section("email:"){
//                        Text("\(email)")
//                    }
//                    Button("Log out"){
//                        UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
//                        print(UserDefaults.standard.bool(forKey: "kIsLoggedIn"))
//                        presentation.wrappedValue.dismiss()
//                        PersistenceController.shared.clear()
//
//                    }
//                    .modifier(button())
//
//                    //
//                }
//
//                .cornerRadius(25)
//
////                .padding(.top, 15.0)
////                .padding(.bottom, 3.0)
//
//
//
//
//
//        }
//
//            .cornerRadius(25)
//            .ignoresSafeArea()
//
//    }
//
//
//
//}
//struct button: ViewModifier {
//func body(content: Content) ->some View {
//        content
////content
//            .font(.largeTitle)
//            .foregroundColor(.white)
//            .padding()
//            .background(.blue)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//    }
//}
//
//
//
//struct UserProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfile()
//    }
//}


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
        ScrollView{
            VStack(alignment: .leading){
                
                Text("Personal information")
                    .font(.title3)
                    .bold()
                Text("Avatar")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .bold()
                HStack(spacing: 20){
                    
                    Image("Profile")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                    Button("Change"){
                        
                    }
                    
                    
                    .modifier(greenButton())
                    
                    Button("Remove"){
                        
                        
                    }
                    .modifier(whiteButton())
                    Spacer()
                }
                .padding(.leading, 4.0)
                
                //                Form(){
                
                Section("First Name: "){
                    Text("\(firstName)")
                        
                }
                .font(.caption)
                .fontWeight(.medium)
                Section("Last Name: "){
                    Text("\(lastName)")
                }
                .font(.caption)
                .fontWeight(.medium)
                Section("email:"){
                    Text("\(email)")
                }
                .font(.caption)
                .fontWeight(.medium)
                Button("Log out"){
                    UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                    print(UserDefaults.standard.bool(forKey: "kIsLoggedIn"))
                    presentation.wrappedValue.dismiss()
                    PersistenceController.shared.clear()
                    
                }
                .modifier(yellowButton())
                HStack{
                    Button("Discard Changes"){
                        
                    }
                    .modifier(whiteButton())
                    Button("Save Changes"){
                        
                    }
                    .modifier(greenButton())
                }
                
                //
                //                }
                
                //                .cornerRadius(25)
                
                //                .padding(.top, 15.0)
                //                .padding(.bottom, 3.0)
                
                
                
                
                
            }
            //        .frame(width: .infinity,height: .infinity)
            
            //            .cornerRadius(25)
            .ignoresSafeArea()
            
        }
    }


}
struct yellowButton: ViewModifier {
func body(content: Content) ->some View {
        content
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
            .background(Color("Primary yellow"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
struct greenButton: ViewModifier {
func body(content: Content) ->some View {
        content
            .font(.body)
            .foregroundColor(Color("Highlight off white"))
            .padding()
            .background(Color("Primary green"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
struct whiteButton: ViewModifier {
func body(content: Content) ->some View {
        content
            .font(.body)
            .foregroundColor(.secondary)
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
    
            .background()
//            .clipShape(RoundedRectangle(cornerRadius: 10))
            .border(Color("Primary green"), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}




struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

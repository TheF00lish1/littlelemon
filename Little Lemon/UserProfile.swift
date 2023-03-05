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
    var lastName: String
    let  email : String
    @State var phoneNumber: String = "(123) 456-7890"
//    var firstNameCopy = firstName
 
   @State private var firstNameCopy = UserDefaults.standard.string(forKey: "kFirstName") ?? ""
    @State private var lastNameCopy = UserDefaults.standard.string(forKey: "kLastName") ?? ""
    @State private var emailCopy = UserDefaults.standard.string(forKey: "kEmail") ?? ""
     

    

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
            VStack(alignment: .center, spacing: 30){
                VStack(alignment: .leading, spacing: 20){
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
                            print("Information successfully chabged")
                        }
                        
                        
                        .modifier(greenButton())
                        
                        Button("Remove"){
                            print("Profile successfully removed")
                        }
                        .modifier(whiteButton())
                        Spacer()
                    }
                    .padding(.leading, 4.0)
                    
                    //                Form(){
                    
                    Section("First Name: "){
                        
                        TextField("First Name", text: $firstNameCopy)
                            .padding()
                            .border(Color("Primary green"), width: 1)
                            .multilineTextAlignment(.leading)
                        
                    }
                    .font(.caption)
                    .fontWeight(.medium)
                    Section("Last Name: "){
                        TextField("First Name", text: $lastNameCopy)
                            .padding()
                            .border(Color("Primary green"), width: 1)
                            .multilineTextAlignment(.leading)
                    }
                    .font(.caption)
                    .fontWeight(.medium)
                    Section("Email:"){
                        TextField("email", text: $emailCopy)
                            .padding()
                            .border(Color("Primary green"), width: 1)
                            .multilineTextAlignment(.leading)
                    }
                    .font(.caption)
                    .fontWeight(.medium)
                    Section("Phone number"){
                        TextField("phoneNumber", text: $phoneNumber)
                            .padding()
                            .border(Color("Primary green"), width: 1)
                            
                    }
                    .font(.caption)
                    .fontWeight(.medium)
                    
                    
                    
                }
                .padding()
                Button("Log out"){
                    UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                    print(UserDefaults.standard.bool(forKey: "kIsLoggedIn"))
                    presentation.wrappedValue.dismiss()
                    PersistenceController.shared.clear()
                    
                }
                .padding(.vertical, 5)

                .modifier(yellowButton())
                
                HStack{
                    Spacer()
                    Button("Discard Changes"){
                        
                    }
                    
                    .modifier(whiteButton())
                    
                    Spacer()
                    Button("Save Changes"){
                        
                    }
                    .modifier(greenButton())
                    Spacer()
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
                    .font(.title3)
            .foregroundColor(.black)
            .padding(.horizontal, 140.0)
            .background(Color("Primary yellow"))
            .clipShape(RoundedRectangle(cornerRadius: 14))
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
        .foregroundColor(Color("Highlight dark gray"))
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .background()
        .border(Color("Primary green"), width: 1)
    }
}




struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

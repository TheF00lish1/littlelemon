//
//  Onboarding.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-02-27.
//

import SwiftUI


struct Onboarding: View {
    
    
  
    @State var heroView = HeroView()

    @State var isLoggedIn = false
    @State  var firstName = ""
    @State  var lastName = ""
    @State  var email = ""
    
    @State private var alertText = "alert sample"
    @State private var showAlert = false
    
    
    let kFirstName = "kFirstName"
    let kLastName = "kLastName"
    let kEmail = "kEmail"
    let kIsLoggedIn = "kIsLoggedIn"

    var body: some View {
        NavigationView(){
            
            VStack(spacing: 0){
                HStack {
                                        Spacer()
                                        Image("Logo")
                                            .resizable()
                                            .scaledToFit()
                                        Spacer()
                }.frame(height: 40.0)
                                .background(Color.white)
                                .opacity(0.9)
                                .padding(.bottom)
                //
                NavigationLink( destination: Home(), isActive: $isLoggedIn){EmptyView()
                }
                heroView
                Form{
                    Section("First Name"){
                        TextField("First Name", text: $firstName)
                    }
                    Section("Last Name "){
                        TextField("Last Name", text: $lastName)
                    }
                    Section("email"){
                        TextField("email ", text: $email)
                    }

                    Button("Register"){
                        formValidation()
//                        showAlert = !showAlert
//                        print(showAlert)
                        //Add an alert

                    }
                    .padding(.horizontal, 125.0)


                }



            }
            
           
            .onAppear(){
                loginCheck()
            }
           
        }
        
    }
    
    func formValidation() {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
            //color of border turns red to indicate which isnt right
                print("Please fill in all required fields")
        
        } else if !emailIsValid(email) {
            print("Please enter a valid email")
        }
        else {
            isLoggedIn = true
            UserDefaults.standard.set(firstName, forKey: "kFirstName")
                   UserDefaults.standard.set(lastName, forKey: "kLastName")
                   UserDefaults.standard.set(email, forKey: "kEmail")
            UserDefaults.standard.set(isLoggedIn, forKey: "kIsLoggedIn")
                   print("Data stored successfully in UserDefaults")
        }
    }
    
    func emailIsValid(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
        
    }
    
    func loginCheck(){
        if UserDefaults.standard.bool(forKey: "kIsLoggedIn") == true {
         isLoggedIn = true
            print(isLoggedIn)
        }
    }
    
    
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}


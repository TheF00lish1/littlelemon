//
//  Home.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-02-27.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    
    
    var body: some View {
        
        VStack(spacing:0){
            HStack() {
                Spacer()
                Spacer()
                Spacer()
                Image("Logo")
                    .resizable()
                    .padding(.leading)
                    .scaledToFit()
                Spacer()
                
                Image("Profile")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 70, height: 70)
                    .scaledToFit()
                Spacer()
            }  .frame(height: 45)
                .background(Color.white)
                .padding(.bottom)
            
            TabView{
                Menu()
                    .environment(\.managedObjectContext, persistence.container.viewContext)
                    .tabItem({Label( "Menu", systemImage: "list.dash")})
                UserProfile()
                    .tabItem({Label( "Profile", systemImage: "square.and.pencil")})
            }
            
            
            
            .navigationBarHidden(true)
            .navigationTitle("Home Screen")
            
            
            
            
            
            
            .navigationBarBackButtonHidden(true)
        }
    }
}
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
//                        .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
    


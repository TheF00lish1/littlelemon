//
//  Home.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-02-27.
//

import SwiftUI

struct Home: View {
    
 

    var body: some View {
//        NavigationView{
                VStack{
                
                    TabView{
                        Menu()
                            .tabItem({Label( "Menu", systemImage: "list.dash")})
                        UserProfile()
                            .tabItem({Label( "Profile", systemImage: "square.and.pencil")})

                    }

            .navigationBarHidden(true)
            .navigationTitle("Home Screen")
     


            

//        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}






    // MARK: - hero section
   //                    Vstack{
   //                    Hstack{
                       
   //                        Vstack{}
   //                        Vstack{}}
   //                    searchField{}
   //
   //                    }
                   
                                           
                       
    // MARK: - Hstack of menu sections -> Tabbed navigation
                       
                       //scrollview
                       //section title "order for delivery" (or something else)
                       //for each category in foodcategory { item in
                       //            HStack { Text("food category")
                       //                                                  }
                       
                       // section separator line
                       
   // MARK: - stack of menu
                       //scrollview
                       //vstack {
   //                    HStack {
   //                        VStack{name description price}
   //                        VStack{photo}
   //                          }
   //                       }
                       
                   }
   //                .ignoresSafeArea()

   // MARK: - header
   //            }







//            .navigationBarItems(leading: T##View)

    
    //toolbar logo
    //toolbar profile icon

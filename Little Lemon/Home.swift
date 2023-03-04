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
                    HStack {
                                            Spacer()
                                            Image("Logo")
                                                .resizable()
                                                .scaledToFit()
                                            Spacer()
                                        }.frame(height: 40)
                                    .background(Color.white)
                                    .opacity(0.9)
                                    .padding(.bottom)
                
                    TabView{
                        Menu()
                          .environment(\.managedObjectContext, persistence.container.viewContext)
                            .tabItem({Label( "Menu", systemImage: "list.dash")})
//
                        UserProfile()
                            .tabItem({Label( "Profile", systemImage: "square.and.pencil")})

                    }
                    
                    

            .navigationBarHidden(true)
            .navigationTitle("Home Screen")
     


            


        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()    
    }
}

//
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//        }
//    }
//

// MARK: - import CoreData
    
//    struct ContentView: View {
//        @Environment(\.managedObjectContext) private var viewContext
//
//        @FetchRequest(
//            sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//            animation: .default)
//        private var items: FetchedResults<Item>
//
//        var body: some View {
//            NavigationView {
//                List {
//                    ForEach(items) { item in
//                        NavigationLink {
//                            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                        } label: {
//                            Text(item.timestamp!, formatter: itemFormatter)
//                        }
//                    }
//                    .onDelete(perform: deleteItems)
//                }
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        EditButton()
//                    }
//                    ToolbarItem {
//                        Button(action: addItem) {
//                            Label("Add Item", systemImage: "plus")
//                        }
//                    }
//                }
//                Text("Select an item")
//            }
//        }



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

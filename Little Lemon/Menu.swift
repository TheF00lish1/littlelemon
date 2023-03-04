//
//  Menu.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-02-27.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var menuItems: [MenuItem] = []
    
    var body: some View {
            VStack{
                Text("Little Lemon")
                Text("Chicago")
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist. ")
                  
            FetchedObjects() { (dishes: [Dish]) in
                List{
                    ForEach(dishes) { dish in
                        HStack{
                            Text("\(dish.title!) - \(dish.price!)")
                            AsyncImage(url: URL(string: dish.image!)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                        }
                    }
                    
                }
                 
            }
                
//                            ForEach(menuItems.menu) { menuItem in
//                                let dish = Dish(context: viewContext)
//                                dish.title = menuItem.title
//                                dish.price = menuItem.price
//
//                                try? viewContext.save()
//
                
            }
            .onAppear(){
                getMenuData()
                print("data fetched")
            }
             
        
    }
    
    
    func getMenuData(){
        PersistenceController.shared.clear() // clear the database before saving new data
        
        
        let serverUrlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        guard let serverUrl = URL(string: serverUrlString) else { return }
        let request = URLRequest(url: serverUrl)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error occurred: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            do {
                let menuList = try JSONDecoder().decode(MenuList.self, from: data)
                DispatchQueue.main.async {
                    for item in menuList.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.image = item.image
                        dish.price = item.price
                        
                        try? viewContext.save()
                    }
                }
                
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
            
        }.resume()
        
        
        
    }
}
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

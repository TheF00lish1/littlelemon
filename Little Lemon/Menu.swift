//
//  Menu.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-02-27.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let heroView = HeroView()
    
    @State var menuItems: [MenuItem] = []
    
    @State var searchText: String = ""
    
    var body: some View {
        VStack(spacing:0){
             heroView
                    .withSearchBar(searchText: $searchText)
                FetchedObjects( predicate: buildPredicate(), sortDescriptors:buildSortDescriptors()) { (dishes: [Dish]) in
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
                    
                }// now outside list
                 
            }// now outside fetched objects
                
                
            } //Now outside Vstack
            .onAppear(){
                getMenuData()
                print("data fetched")
            }
             
        
    }// now outside body view, under are view methods
    
    
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
        
        
        
    }//now outside getMenuData
    
    func buildSortDescriptors() -> [NSSortDescriptor]{
        return [
            NSSortDescriptor(key: "title", ascending: true, selector:  #selector(NSString.localizedStandardCompare) )
        ]
    }
    
    func buildPredicate() -> NSPredicate{
        return searchText.isEmpty ?  NSPredicate(value: true) :       NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
}// end of Menu view

extension HeroView {
    func withSearchBar(searchText: Binding<String>) -> some View {
        VStack(spacing: 0) {
            self
                
            HStack {
                TextField("\(Image(systemName: "magnifyingglass")) Search menu", text: searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding([.leading, .bottom, .trailing])
        }
        
        .background(Color("Primary green"))
        
    }
}





struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

//
//  Menu.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-02-27.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist. ")
            List{}

        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
